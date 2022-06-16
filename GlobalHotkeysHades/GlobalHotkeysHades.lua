ModUtil.Mod.Register( "GlobalHotkeysHades" )

GlobalHotkeysHades.Events = {
  	one_health = function( )
		Damage( CurrentRun.Hero, { triggeredById = CurrentRun.Hero.ObjectId, DamageAmount = CurrentRun.Hero.MaxHealth - 1, MinHealth = 1, PureDamage = true, Silent = false })
  	end,
	fifty_damage = function( )
		Damage( CurrentRun.Hero, { triggeredById = CurrentRun.Hero.ObjectId, DamageAmount = CurrentRun.Hero.MaxHealth / 2, MinHealth = 1, PureDamage = true, Silent = false })
	end,
	instant_death = function( )
		KillHero({},{},{})
	end,
	spawn_enemies = function( )
		local EnemyTable = {}
		local amount = math.random(1,8)
		for i = 1, amount do
		  table.insert(EnemyTable,"ChariotSuicide")
		end
		for _,v in ipairs(EnemyTable) do
		  local enemyData = EnemyData[v]
		  local newEnemy = DeepCopyTable( enemyData )
		  newEnemy.ObjectId = SpawnUnit({ Name = newEnemy.Name, Group = "Standing", DestinationId = CurrentRun.Hero.ObjectId, OffsetX = math.random(-500,500), OffsetY = math.random(-500,500) })
		  SetupEnemyObject( newEnemy, CurrentRun, { SkipSpawnVoiceLines = true } )
		  UseableOff({ Id = newEnemy.ObjectId })
		end
	end
 } 

 function GlobalHotkeysHades.DoEvent( name )
	GlobalHotkeysHades.Events[ name ]( )
 end

StyxScribe.AddHook( GlobalHotkeysHades.DoEvent, "GlobalHotkeysHades: ", GlobalHotkeysHades )