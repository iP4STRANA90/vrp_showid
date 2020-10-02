local lang = vRP.lang
local Luang = module("vrp", "lib/Luang")
local vRPshowId = class("vRPshowId", vRP.Extension)


function vRPshowId:__construct()
    vRP.Extension.__construct(self)
    -- load cfg
    self.cfg = module("vrp_showid","cfg/showid")
    -- load lang
    self.luang = Luang()
    self.luang:loadLocale(vRP.cfg.lang, module("vrp_showid", "cfg/lang/"..vRP.cfg.lang))
    self.lang = self.luang.lang[vRP.cfg.lang]

end

vRPshowId.event = {}

function vRPshowId.event:playerSpawn(user, first_spawn)
  if first_spawn then
    -- show id
    local vid = vRP.users[id]
    local info = user.id
      vRP.EXT.GUI.remote._setDiv(user.source,"vid",self.cfg.vid_css,self.lang.identity.showid({info}))
  end
end

vRP:registerExtension(vRPshowId)
