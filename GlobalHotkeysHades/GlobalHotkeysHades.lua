ModUtil.Mod.Register( "GlobalHotkeysHades" )

GlobalHotkeysHades.Events = {
  	one_health = function( )
		Damage( CurrentRun.Hero, { triggeredById = CurrentRun.Hero.ObjectId, DamageAmount = CurrentRun.Hero.MaxHealth - 1, MinHealth = 1, PureDamage = false, Silent = false })
  	end,
	fifty_damage = function( )
		Damage( CurrentRun.Hero, { triggeredById = CurrentRun.Hero.ObjectId, DamageAmount = 50, MinHealth = 0, PureDamage = false, Silent = false })
	end,
	instant_death = function( )
		KillHero({},{},{})
	end,
	spawn_enemies = function( )
		local EnemyTable = {}
		local   EnemyNames =
		{
		  "IllusionistClone", "ShieldRangedElite", "BlastCubeFusedRegenerating", "PunchingBagUnitSuperElite", "LightSpawner", "SwarmerSuperElite",
		  "CrusherUnit", "ChariotSuicide", "IllusionistClone", "ShieldRangedElite", "BlastCubeFusedRegenerating", "PunchingBagUnitSuperElite", "ReflectiveMirror", "LightSpawner",
		  "SwarmerSuperElite", "CrusherUnit", "ChariotSuicide", "ShadeSpawnerElite", "UnstableGenerator", "HeavyMeleeSuperElite", "HeavyRangedElite",
		  "ShadeBowUnitSuperElite", "TimeCrystal", "Illusionist", "GunBombUnit", "HeavyRanged", "FlurrySpawner", "RangedBurrowerElite", "SplitShotUnitElite", "Harpy",
		  "HeavyRangedSplitterMinibossSuperElite", "ChariotSuperElite", "SupportShields", "BloodlessNakedBerserkerElite", "ShadeNaked", "ShadeSwordUnit", "BloodlessSelfDestructElite", "CrusherUnitSuperElite", "LightRanged", "HeavyMelee", "HealRanged", "ThiefMineLayer"
		}
		local amount = math.random(1,5)
		for i = 1, amount do
		  table.insert(EnemyTable,EnemyNames[math.random(44)])
		end
		for _,v in ipairs(EnemyTable) do
		  local enemyData = EnemyData[v]
		  local newEnemy = DeepCopyTable( enemyData )
		  newEnemy.ObjectId = SpawnUnit({ Name = enemyData.Name, Group = "Standing", DestinationId = CurrentRun.Hero.ObjectId, OffsetX = math.random(-500,500), OffsetY = math.random(-500,500) })
		  SetupEnemyObject( newEnemy, CurrentRun, { SkipSpawnVoiceLines = true } )
		  UseableOff({ Id = newEnemy.ObjectId })
		end
	end,
	spawn_meg = function( )
		   local EnemyTable = {}
		   table.insert(EnemyTable,"Harpy")
		  for _,v in ipairs(EnemyTable) do
		   local enemyData = EnemyData[v]
		   local newEnemy = DeepCopyTable( enemyData )
		   newEnemy.ObjectId = SpawnUnit({ Name = enemyData.Name, Group = "Standing", DestinationId = CurrentRun.Hero.ObjectId, OffsetX = math.random(-500,500), OffsetY = math.random(-500,500) })
		   SetupEnemyObject( newEnemy, CurrentRun, { SkipSpawnVoiceLines = true } )
		   UseableOff({ Id = newEnemy.ObjectId })
		  end
	end
 } 

 function GlobalHotkeysHades.DoEvent( name )
	GlobalHotkeysHades.Events[ name ]( )
 end

StyxScribe.AddHook( GlobalHotkeysHades.DoEvent, "GlobalHotkeysHades: ", GlobalHotkeysHades )