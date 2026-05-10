--select * from dbo.manufacturer
--select * from dbo.VIN_components

declare @manufacturer_id int = 1
declare @division_code varchar(10) = '3'
declare @year int = 1964

declare @skip_division bit = 0,
	@division_name varchar(50),
	@VIN_pattern_id int

SELECT @division_name = vcv.component_value
	FROM dbo.VIN_components vc 
	JOIN VIN_component_values vcv 
		ON vc.id = vcv.VIN_component_id
		AND vcv.component_code = @division_code
	WHERE vc.component_name = 'Division'

IF NOT EXISTS(SELECT * FROM dbo.VIN_pattern WHERE manufacturer_id = @manufacturer_id AND division_code = @division_code AND @year between year_start and year_end)
BEGIN 
	SELECT @skip_division = 1
END

IF @skip_division = 0
BEGIN
	select @VIN_pattern_id = id
	from dbo.VIN_pattern 
	where manufacturer_id = @manufacturer_id
		and (division_code = @division_code)
		and @year between year_start and year_end

	SELECT @year vin_year, m.name, vcv. component_code division_code, vcv.component_value division_name, vp.year_start, vp.year_end, vp.digits, vp.variable_digits, vp.sample_value
	FROM dbo.VIN_pattern vp
	JOIN dbo.manufacturer m ON vp.manufacturer_id = m.id
	JOIN dbo.VIN_components vc 
		ON vp.manufacturer_id = vc.manufacturer_id
		AND vc.component_name = 'Division'
	JOIN VIN_component_values vcv 
		ON vc.id = vcv.VIN_component_id
		AND (vcv.component_code = @division_code)
	WHERE vp.id = @VIN_pattern_id
END

IF @skip_division = 1
BEGIN
	select @VIN_pattern_id = id
	--select * 
	from dbo.VIN_pattern 
	where manufacturer_id = @manufacturer_id
		--and (division_code = @division_code OR @division_code IS NULL)
		and @year between year_start and year_end

	SELECT @year vin_year, m.name, '-' division_code, 'All Divisions' division_name, vp.year_start, vp.year_end, vp.digits, vp.variable_digits, vp.sample_value
	FROM dbo.VIN_pattern vp
	JOIN dbo.manufacturer m ON vp.manufacturer_id = m.id
	--JOIN dbo.VIN_components vc 
	--	ON vp.manufacturer_id = vc.manufacturer_id
	--	AND vc.component_name = 'Division'
	--JOIN VIN_component_values vcv 
	--	ON vc.id = vcv.VIN_component_id
	--	AND (vcv.component_code = @division_code)
	WHERE vp.id = @VIN_pattern_id
END

SELECT vpd.sequence_number, vc.component_name, vpd.position, vpd.characters  --vpd.
FROM dbo.VIN_pattern_detail vpd
JOIN dbo.VIN_components vc ON vpd.VIN_component_id = vc.id
WHERE VIN_pattern_id = @VIN_pattern_id
ORDER BY vpd.sequence_number

SELECT *
FROM 
	(SELECT vpd.id, vpd.sequence_number, vc.component_name, vpd.position, vpd.characters  --vpd.
	FROM dbo.VIN_pattern_detail vpd
	JOIN dbo.VIN_components vc ON vpd.VIN_component_id = vc.id
	WHERE VIN_pattern_id = @VIN_pattern_id) v
JOIN dbo.VIN_component_values vcv 
	ON v.id = vcv.VIN_component_id
	--AND (@year BETWEEN ISNULL(vcv.year_start, 1900) AND ISNULL(vcv.year_end, 2100))
WHERE ((v.component_name = 'Division' AND vcv.component_code = @division_code) OR v.component_name <> 'Division')
ORDER BY v.sequence_number

--SELECT vpd.sequence_number, vc.component_name, vcv.*
--FROM dbo.VIN_pattern_detail vpd
--JOIN dbo.VIN_components vc ON vpd.VIN_component_id = vc.id
--JOIN dbo.VIN_component_values vcv 
--	ON vc.id = vcv.VIN_component_id
--	AND @year BETWEEN ISNULL(year_start, 1900) AND ISNULL(year_end, 2100)
--WHERE VIN_pattern_id = @VIN_pattern_id
--	AND vcv.division_code IS NULL OR vcv.division_code = @division_code
--	AND ((vc.component_name = 'Division' AND vcv.component_code = @division_code)
--		OR (vc.component_name <> 'Division'))
--ORDER BY vpd.sequence_number
