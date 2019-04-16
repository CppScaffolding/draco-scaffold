-- scaffold geniefile for draco

draco_script = path.getabsolute(path.getdirectory(_SCRIPT))
draco_root = path.join(draco_script, "draco")

draco_includedirs = {
	path.join(draco_script, "config"),
	draco_root,
}

draco_libdirs = {}
draco_links = {}
draco_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { draco_includedirs }
	end,

	_add_defines = function()
		defines { draco_defines }
	end,

	_add_libdirs = function()
		libdirs { draco_libdirs }
	end,

	_add_external_links = function()
		links { draco_links }
	end,

	_add_self_links = function()
		links { "draco" }
	end,

	_create_projects = function()

project "draco"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		draco_includedirs,
	}

	defines {}

	files {
		path.join(draco_script, "config", "**.h"),
		path.join(draco_root, "**.h"),
		path.join(draco_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
