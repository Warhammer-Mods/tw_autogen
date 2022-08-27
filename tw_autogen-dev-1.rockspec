package = "tw_autogen"
version = "dev-1"
source = {
   url = "git+https://im-mortal@github.com/Warhammer-Mods/tw_autogen.git"
}
description = {
   summary = "This is an autogenerator program to create all the necessary files to set up a development environment, to make creating Lua mods for Total War significantly easier.",
   detailed = "This is an autogenerator program to create all the necessary files to set up a development environment, to make creating Lua mods for Total War significantly easier. This process uses the script documentation provided by Creative Assembly, translates their HTML files to Lua files, and uses a Lua plugin to incorporate pretty good error checking.",
   homepage = "*** please enter a project homepage ***",
   license = "*** please specify a license ***"
}
dependencies = {
   "lua ~> 5.1",
   "luafilesystem ~> 1"
}
build = {
   type = "builtin",
   modules = {
      def = "def.lua",
      doc_obj = "doc_obj.lua",
      ["includes.30-log"] = "includes/30-log.lua",
      main = "main.lua",
      ["override_methods.battle_pancake_param_and_comment_fixes"] = "override_methods/battle_pancake_param_and_comment_fixes.lua",
      ["override_methods.battle_pancake_warnings"] = "override_methods/battle_pancake_warnings.lua",
      ["override_methods.vandy"] = "override_methods/vandy.lua",
      ["override_types.vandy"] = "override_types/vandy.lua",
      overrides = "overrides.lua"
   },
   install = {
      bin = {
         "bin/tw_autogen"
      }
   }
}
