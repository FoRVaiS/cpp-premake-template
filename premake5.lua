function get_path_tail(path)
  local tail = ""
  local separator = package.config:sub(1, 1) == "\\" and "\\" or "/"
  local pos = string.find(path, separator, nil, true)

  if pos then
    local last_pos = pos
    while pos do
      last_pos = pos
      pos = string.find(path, separator, pos + 1, true)
    end
    tail = string.sub(path, last_pos + 1)
  else
    tail = path
  end

  return tail
end

workspace(get_path_tail(_WORKING_DIR))
  architecture "x86_64"
  configurations { "Debug", "Release", "Dist" }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

group "Packages"
  -- Iterate over each file in the "packages" directory and include it in the workspace.
  for _, package in ipairs(os.matchdirs("packages/*")) do
    include(package)
  end
group ""
