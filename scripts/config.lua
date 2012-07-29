Setup.Package
{
 	vendor = "liflg.org",
 	id = "myth2",
 	description = "Myth 2",
 	version = "1.3e-english",
 	splash = "splash.png",
 	superuser = false,
	write_manifest = true,
 	support_uninstall = true,
 	recommended_destinations =
 	{
 		"/usr/local/games",
		"/opt",
		MojoSetup.info.homedir,
 	},

 	Setup.Readme
 	{
 		description = "README",
 		source = "README.liflg"
 	},

	Setup.Media
 	{
 		id = "myth2-disc",
		description = "Myth 2 Loki disc",
		uniquefile = "bin/x86/glibc-2.1/myth2_x11"	
 	},

	Setup.Option {
		required = true,
		description = "Files for Myth 2",
		bytes = 524483873,
                Setup.DesktopMenuItem
                {
                	disabled = false,
			name = "Myth 2",
                        genericname = "Myth 2",
                        tooltip = "Play Myth 2",
                        builtin_icon = false,
                        icon = "myth2.xpm",
                        commandline = "%0/myth2_x11.dynamic.sh",
                        category = "Game",
                },
		
		Setup.File {
			source = "media://myth2-disc/bin/x86/glibc-2.1/",
			wildcards = {"myth2_x11", "myth2_glide"},
			permissions = "755",
		},

		Setup.File {
			source = "media://myth2-disc/",
			allowoverwrite = true,
			wildcards = {"README", "tags/*", "plugins/*", "manual/*"},
		},
		
		Setup.File {
			source = "media://myth2-disc/desktop/",
			filter = function(dest)
				if ( string.match( dest, "soulblighter" ) ) then
					return nil
				end
				return dest
			end
		},

		Setup.File
		{
			source = "base:///ld_preload_myth_mem_fix-0.2.tar.gz/",
		},

		Setup.File
		{
			source = "base:///libSDL-1.1.tar.xz/",
		},

		Setup.File
		{
			source = "base:///libgtk1.2.tar.xz/",
		},

		Setup.File
		{
			source = "base:///libesd-alsa0_0.2.36-3_i386.tar.xz/", -- needed for loathing
		},
	
		Setup.File
		{
			source = "base:///libaudiofile0_0.2.6-7_i386.tar.xz/", -- needed for loathing
		},

		Setup.File
		{
			source = "base:///gdk-imlib1_1.9.15-7_i386.tar.xz/", -- needed for loathing
		},

		Setup.File 
		{
			wildcards = { "myth2_x11.sh", "myth2_glide.sh", "fopenr.so" },
			permissions = "0755",
		},

		Setup.File
		{	
			wildcards = "README.liflg",
		},
		
		Setup.Option {
			value = false,
			description = "Install Tag Editor",
			bytes = 3246992, 
			Setup.File {
				source = "media://myth2-disc/bin/x86/glibc-2.1/",
				allowoverwrite = true,
				wildcards = "fear",
				permissions = "0755",
			},

			Setup.File {
				wildcards = "fear.sh",
				permissions = "755",
			},
	
			Setup.File {
				source = "media://myth2-disc/",
				allowoverwrite = true,
				wildcards = {"tools_docs/*", "README.tools"},
			},		

			Setup.DesktopMenuItem
                	{
				disabled = false,
				name = "Myth 2 Tag Editor",
				genericname = "Myth 2 Tag Editor",
				tooltip = "Start the Myth 2 Tag Editor",
				builtin_icon = false,
				icon = "myth2.xpm",
				commandline = "%0/fear.sh",
				category = "Game",
			},
		},
		
		Setup.Option {
			value = false,
			description = "Install Mesh Editor",
			bytes = 2704960,
			Setup.File {
				source = "media://myth2-disc/bin/x86/glibc-2.1/",
				allowoverwrite = true,
				wildcards =  "loathing",
				permissions = "0755",
			},

			Setup.File {
				source = "media://myth2-disc/",
				allowoverwrite = true,
				wildcards = {"tools_docs/*", "README.tools"},
			},

			Setup.File {
				wildcards = "loathing.sh",
				permissions = "755",
			},
			
			Setup.DesktopMenuItem
                	{
				disabled = false,
				name = "Myth 2 Mesh Editor",
				genericname = "Myth 2 Mesh Editor",
				tooltip = "Start the Myth 2 Mesh Editor",
				builtin_icon = false,
				icon = "myth2.xpm",
				commandline = "%0/loathing.sh",
				category = "Game",
			},
		},


		Setup.Option {
			value = true,
			required = true,
			description = "Apply Patch 1.3e",
			tooltip = "Latest update from Loki",
			bytes = 9881600,
			Setup.File{
				allowoverwrite = true,
				source = "base:///patch-1.3e.tar.xz/",
				filter = function(dest)
					if ( string.match( dest, "myth2_" ) ) then
						return dest, "0755"
					end
					return dest
				end
			},

			Setup.File{
				wildcards = {"myth2_x11.dynamic.sh", "myth2_glide.dynamic.sh"},
				permissions = "755",
			},
		},
				
		Setup.Option {
			value = true,
			required = true,
			description = "Install Movies",
			tooltip = "If Myth 2 crashes after playing movies, unselect this option",
			bytes = 114143684, 
			Setup.File{
				source = "media://myth2-disc/",
				wildcards = "cutscenes/*",
			},
		},
		
		Setup.Option {
			value = true,
			required = false,
			description = "Install the addon Chimera",
			tooltip = "Adds a new campain",
			bytes = 156819707, 
			Setup.File{
				source = "base:///chimera.tar.xz/",
			},
		},


	},
}			
