fx_version 'cerulean'
version '1.0.0'
lua54 'yes'
game 'gta5'

author "Echo Labs"
description "EL-police-loadout"

shared_scripts {
    "config.lua",
    '@ox_lib/init.lua',
}

client_scripts {
    "client/*.lua",
}

server_scripts {
    "server/*.lua",
}

