workspace "cpp-workspace"
  architecture "x86_64"
  configurations { "Debug", "Release", "Dist" }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

group "Packages"
  -- Iterate over each file in the "packages" directory and include it in the workspace.
  for _, package in ipairs(os.matchdirs("packages/*")) do
    include(package)
  end
group ""
