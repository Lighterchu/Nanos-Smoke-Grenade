
function GrenadeType()
    local weapon = Grenade(location or Vector(), rotation or Rotator(),"nanos-world::SM_Spraycan_01","nanos-world::P_Weapon_BarrelSmoke")
    weapon:SetMaterial("nanos-world::M_NanosMasked")

-- paints it red
weapon:SetMaterialColorParameter("Tint", color or  Color(0, 0, 0))
    
    weapon:SetDamage(0, 0, 0, 0, 0)
    Grenade.Subscribe("Explode", function(self)
        local grabPos = self:GetLocation()
        Package.Log(grabPos)
            local timeScale = 0 
            local smokeOverTime = 1
            Timer.SetInterval(function()
                if(i == 20 ) then return false end
                timeScale = timeScale + 1
                    if (i  > 10 ) then 
                        smokeOverTime = 0
                    else
                        smokeOverTime = smokeOverTime + 0.5
                    end 
                local particle_asset = "nanos-world::P_Smoke"
                local particle_burst = Particle(grabPos, Rotator(), particle_asset, false , true)
                particle_burst:SetScale(Vector(smokeOverTime,smokeOverTime,smokeOverTime))
                particle_burst:SetLifeSpan(10)
            end,1000)
        end)
    return weapon
end

Package.Export("SpawnSmokeGrenade", GrenadeType)

Package.Subscribe("Load", function() 
	Package.Call("sandbox", "AddSpawnMenuItem", "nanos-world", "weapons", "SmokeGrenade", "nanos-smoke-grenade", "SpawnSmokeGrenade")
	return false
end)

