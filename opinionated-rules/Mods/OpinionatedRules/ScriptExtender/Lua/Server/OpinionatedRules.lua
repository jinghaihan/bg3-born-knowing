-- Osi.PROC_UnlockWaypoint("WAYP_UND_GP_HookHorror", Osi.GetHostCharacter())

function UnlockAct1Waypoint()
  -- Act1
  Osi.PROC_UnlockWaypoint("WAYP_HAG_Swamp", Osi.GetHostCharacter())
  Osi.PROC_UnlockWaypoint("WAYP_DEN_Camp", Osi.GetHostCharacter())
  Osi.PROC_UnlockWaypoint("WAYP_CHA_Top", Osi.GetHostCharacter())
  Osi.PROC_UnlockWaypoint("WAYP_CHA_Chapel", Osi.GetHostCharacter())
  Osi.PROC_UnlockWaypoint("WAYP_PLA_Toll", Osi.GetHostCharacter())
  Osi.PROC_UnlockWaypoint("WAYP_GOB_Temple", Osi.GetHostCharacter())
  Osi.PROC_UnlockWaypoint("WAYP_PLA_Tavern", Osi.GetHostCharacter())
  Osi.PROC_UnlockWaypoint("WAYP_PLA_ZhentDungeon", Osi.GetHostCharacter())
  Osi.PROC_UnlockWaypoint("WAYP_FOR_Ruins", Osi.GetHostCharacter())
  Osi.PROC_UnlockWaypoint("WAYP_FOR_Bottomless", Osi.GetHostCharacter())
  Osi.PROC_UnlockWaypoint("WAYP_UND_Beach", Osi.GetHostCharacter())
  Osi.PROC_UnlockWaypoint("WAYP_UND_Duergar", Osi.GetHostCharacter())
  Osi.PROC_UnlockWaypoint("WAYP_UND_Sussur", Osi.GetHostCharacter())
  Osi.PROC_UnlockWaypoint("WAYP_UND_Myconid", Osi.GetHostCharacter())
  Osi.PROC_UnlockWaypoint("WAYP_UND_Fort", Osi.GetHostCharacter())
  Osi.PROC_UnlockWaypoint("WAYP_UND_AdamantineForge", Osi.GetHostCharacter())
  
  -- Act1b
  Osi.PROC_UnlockWaypoint("WAYP_CRE_Exterior", Osi.GetHostCharacter())
  Osi.PROC_UnlockWaypoint("WAYP_CRE_Monastery", Osi.GetHostCharacter())
  Osi.PROC_UnlockWaypoint("WAYP_CRE_Creche", Osi.GetHostCharacter())
end

function UnlockAct2Waypoint()
  -- Act2
  Osi.PROC_UnlockWaypoint("WAYP_SHA_NightsongPrison_Entrance", Osi.GetHostCharacter())
  Osi.PROC_UnlockWaypoint("WAYP_SHA_Temple", Osi.GetHostCharacter())
  Osi.PROC_UnlockWaypoint("WAYP_TWN_Center", Osi.GetHostCharacter())
  Osi.PROC_UnlockWaypoint("WAYP_TWN_Mausoleum", Osi.GetHostCharacter())
  Osi.PROC_UnlockWaypoint("WAYP_MOO_TowerExterior", Osi.GetHostCharacter())
  Osi.PROC_UnlockWaypoint("WAYP_HAV_Outside", Osi.GetHostCharacter())
  Osi.PROC_UnlockWaypoint("WAYP_SCL_Highroad", Osi.GetHostCharacter())
  Osi.PROC_UnlockWaypoint("WAYP_SCL_OliverHouse", Osi.GetHostCharacter())
end

function UnlockAct3Waypoint()
  -- Act3
  Osi.PROC_UnlockWaypoint("WAYP_WYR_Rivington", Osi.GetHostCharacter())
  Osi.PROC_UnlockWaypoint("WAYP_WYR_SharessCaress", Osi.GetHostCharacter())
  Osi.PROC_UnlockWaypoint("WAYP_WYR_WyrmRock", Osi.GetHostCharacter())

  -- Act3b
  Osi.PROC_UnlockWaypoint("WAYP_LOW_StartingArea", Osi.GetHostCharacter())
  Osi.PROC_UnlockWaypoint("WAYP_LOW_CityBeach", Osi.GetHostCharacter())
  Osi.PROC_UnlockWaypoint("WAYP_LOW_CentralWall", Osi.GetHostCharacter())
  Osi.PROC_UnlockWaypoint("WAYP_LOW_BaldursGateArea", Osi.GetHostCharacter())
  Osi.PROC_UnlockWaypoint("WAYP_LOW_DocksArea", Osi.GetHostCharacter())
  Osi.PROC_UnlockWaypoint("WAYP_LOW_Cesspool", Osi.GetHostCharacter())
  Osi.PROC_UnlockWaypoint("WAYP_LOW_UndercityRuins", Osi.GetHostCharacter())
  Osi.PROC_UnlockWaypoint("WAYP_LOW_BhaalTemple", Osi.GetHostCharacter())
  Osi.PROC_UnlockWaypoint("WAYP_LOW_CazadorsPalace", Osi.GetHostCharacter())
  Osi.PROC_UnlockWaypoint("WAYP_LOW_MorphicPoolDoc", Osi.GetHostCharacter())
end

function removeChamberOfJustice()
  for i,v in ipairs(Osi.DB_CRIME_GuardKiller:Get(nil,nil,nil,nil,nil,nil,nil)) do CrimeSuspend(v[7]) print(v[7]) end
  Osi.RemoveStatus(GetHostCharacter(), "GB_GUARDKILLER")
  Osi.DB_CRIME_GuardKiller:Delete(nil, nil, nil, nil, nil, nil, nil)
end

Ext.Osiris.RegisterListener("ApprovalRatingChangeAttempt", 5, "before", function(ratingOwner, ratedEntity, attemptedApprovalChange, clampedApprovalChange, newApproval)
  local delta = attemptedApprovalChange
  if delta < 0 then
    local positiveChange = math.abs(delta)
    Osi.ChangeApprovalRating(ratingOwner, ratedEntity, 0, positiveChange)
    return 0
  end
  return 1
end)

Ext.Osiris.RegisterListener("StatusApplied", 4, "after", function(object, status, cause, storyActionID)
  if status == "GB_GUARDKILLER" then
    removeChamberOfJustice()
  end
end)

Ext.Osiris.RegisterListener("LevelGameplayStarted", 2, "after", function(levelName, isEditorMode)
  removeChamberOfJustice()
end)
