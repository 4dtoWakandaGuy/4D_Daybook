//%attributes = {}
If (False:C215)
	//Project Method Name:      ProcessService_ListItems
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/01/2010 10:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ListIDS; 0)
	ARRAY LONGINT:C221($_al_ListSublistIDS; 0)
	//ARRAY LONGINT(AA_al_ListItemsID;0)
	//ARRAY LONGINT(AA_al_PropertiesNUM;0;0)
	//ARRAY TEXT(AA_at_ListItems;0)
	//ARRAY TEXT(AA_at_ListItemsProperties;0)
	//ARRAY TEXT(AA_at_Properties;0;0)
	//ARRAY TEXT(AA_at_PropertiesNAM;0;0)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_GroupParentID; $_l_ListIndex; $_l_ListItemsIndex; $_l_ParentID; $_l_ParentSublistRow; $_l_QualitiesIndex; $_l_RootParentID; $_l_SublistPropertyColumn)
	C_TEXT:C284($_t_GroupName; $_t_oldMethodName; $_t_SubGroupName)
End if 

//Code Starts Here

//NEW METHOD
$_t_oldMethodName:=ERR_MethodTracker("ProcessService_ListItems")
//ProcessService_listitems
// 18/1/2002 NG
// Runs various met
$0:=False:C215

Case of 
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="Update Related")
		//this will find the related data
		//and update the values in the strings
		READ ONLY:C145([LIST_ITEMS:95])
		MESSAGES OFF:C175
		QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=[PROCESSES_TO_HANDLE:115]RecordNumber:7)
		
		$_t_SubGroupName:=[LIST_ITEMS:95]List_Entry:2
		$_l_ParentID:=[LIST_ITEMS:95]X_ListID:4
		$_l_RootParentID:=0
		If ([LIST_ITEMS:95]X_ListID:4>0)
			QUERY:C277([x_ListUsage:112]; [x_ListUsage:112]x_ListID:2=$_l_ParentID)
			If (Records in selection:C76([x_ListUsage:112])>0)
				
				$_l_RootParentID:=$_l_ParentID
				$_l_GroupParentID:=$_l_ParentID
				QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=$_l_ParentID)
				$_t_GroupName:=[LIST_ITEMS:95]List_Entry:2
			Else 
				//this could be a sublist
				
				
				ARRAY TEXT:C222(AA_at_ListItems; 0)
				ARRAY LONGINT:C221(AA_al_ListItemsID; 0)
				ARRAY TEXT:C222(AA_at_ListItemsProperties; 0)
				ARRAY TEXT:C222(AA_at_Properties; 0; 0)
				ARRAY LONGINT:C221(AA_al_PropertiesNUM; 0; 0)
				ARRAY TEXT:C222(AA_at_PropertiesNAM; 0; 0)
				ALL RECORDS:C47([X_LISTS:111])
				SELECTION TO ARRAY:C260([X_LISTS:111]x_ID:1; $_al_ListIDS)
				For ($_l_ListIndex; 1; Size of array:C274($_al_ListIDS))
					AA_LoadListbyID($_al_ListIDS{$_l_ListIndex}; ->AA_at_ListItems; ->AA_al_ListItemsID; False:C215; ->AA_at_ListItemsProperties; ->AA_at_Properties; ->AA_al_PropertiesNUM; ->AA_at_PropertiesNAM)
					ARRAY LONGINT:C221($_al_ListSublistIDS; Size of array:C274(AA_at_ListItems))
					For ($_l_ListItemsIndex; 1; Size of array:C274(AA_at_ListItems))
						$_l_SublistPropertyColumn:=Find in array:C230(AA_at_Properties{$_l_ListItemsIndex}; "SUBLIST")
						If ($_l_SublistPropertyColumn>0)
							$_al_ListSublistIDS{$_l_ListItemsIndex}:=AA_al_PropertiesNUM{$_l_ListItemsIndex}{$_l_SublistPropertyColumn}
						End if 
						
					End for 
					$_l_ParentSublistRow:=Find in array:C230($_al_ListSublistIDS; $_l_ParentID)
					If ($_l_ParentSublistRow>0)
						
						$_l_RootParentID:=$_al_ListIDS{$_l_ListIndex}
						$_l_GroupParentID:=AA_al_ListItemsID{$_l_ParentSublistRow}
						$_t_GroupName:=AA_at_ListItems{$_l_ParentSublistRow}
						$_l_ListIndex:=Size of array:C274($_al_ListIDS)
					End if 
				End for 
				
			End if 
			
			If ($_l_RootParentID>0)
				QUERY:C277([x_ListUsage:112]; [x_ListUsage:112]x_ListID:2=$_l_RootParentID)
				If (Records in selection:C76([x_ListUsage:112])>0)
					Case of 
						: ([x_ListUsage:112]x_TableID:3=Table:C252(->[INFORMATION:55]))
							READ WRITE:C146([INFORMATION:55])
							QUERY:C277([INFORMATION:55]; [INFORMATION:55]QualityID:14=[PROCESSES_TO_HANDLE:115]RecordNumber:7)
							If (Records in selection:C76([INFORMATION:55])>0)
								CREATE SET:C116([INFORMATION:55]; "ApplySet")
								If (In transaction:C397)
									QUERY SELECTION:C341([INFORMATION:55]; [INFORMATION:55]QualityRecordID:16=0)
									If (Records in selection:C76([INFORMATION:55])>0)
										For ($_l_QualitiesIndex; 1; Records in selection:C76([INFORMATION:55]))
											[INFORMATION:55]QualityRecordID:16:=0
											DB_SaveRecord(->[INFORMATION:55])
											AA_CheckFileUnlockedByTableNUM(Table:C252(->[INFORMATION:55]))
											NEXT RECORD:C51([ORDER_ITEMS:25])
										End for 
									End if 
									USE SET:C118("ApplySet")
								End if 
								
								DB_lockFile(->[INFORMATION:55])
								APPLY TO SELECTION:C70([INFORMATION:55]; [INFORMATION:55]Group:2:=$_t_GroupName)
								
								AA_CheckFileUnlockedByTableNUM(Table:C252(->[INFORMATION:55]))
								If (Records in set:C195("LockedSet")>0)
									Repeat 
										IDLE:C311
										USE SET:C118("LockedSet")
										If (In transaction:C397)
											CREATE SET:C116([INFORMATION:55]; "ApplySet2")
											QUERY SELECTION:C341([INFORMATION:55]; [INFORMATION:55]QualityRecordID:16=0)
											If (Records in selection:C76([INFORMATION:55])>0)
												For ($_l_QualitiesIndex; 1; Records in selection:C76([INFORMATION:55]))
													[INFORMATION:55]QualityRecordID:16:=0
													DB_SaveRecord(->[INFORMATION:55])
													AA_CheckFileUnlockedByTableNUM(Table:C252(->[INFORMATION:55]))
													NEXT RECORD:C51([INFORMATION:55])
												End for 
											End if 
											USE SET:C118("ApplySet2")
										End if 
										
										DB_lockFile(->[INFORMATION:55])
										APPLY TO SELECTION:C70([INFORMATION:55]; [INFORMATION:55]Group:2:=$_t_GroupName)
										
										AA_CheckFileUnlockedByTableNUM(Table:C252(->[INFORMATION:55]))
										DelayTicks(30)
									Until (Records in set:C195("LockedSet")=0)
								End if 
								USE SET:C118("ApplySet")
								If (In transaction:C397)
									QUERY SELECTION:C341([INFORMATION:55]; [INFORMATION:55]QualityRecordID:16=0)
									If (Records in selection:C76([INFORMATION:55])>0)
										For ($_l_QualitiesIndex; 1; Records in selection:C76([INFORMATION:55]))
											[INFORMATION:55]QualityRecordID:16:=0
											DB_SaveRecord(->[INFORMATION:55])
											AA_CheckFileUnlockedByTableNUM(Table:C252(->[INFORMATION:55]))
											NEXT RECORD:C51([INFORMATION:55])
										End for 
									End if 
									USE SET:C118("ApplySet")
								End if 
								DB_lockFile(->[INFORMATION:55])
								APPLY TO SELECTION:C70([INFORMATION:55]; [INFORMATION:55]QualityGroupID:15:=$_l_GroupParentID)
								
								AA_CheckFileUnlockedByTableNUM(Table:C252(->[INFORMATION:55]))
								If (Records in set:C195("LockedSet")>0)
									Repeat 
										USE SET:C118("LockedSet")
										If (In transaction:C397)
											CREATE SET:C116([INFORMATION:55]; "ApplySet2")
											QUERY SELECTION:C341([INFORMATION:55]; [INFORMATION:55]QualityRecordID:16=0)
											If (Records in selection:C76([INFORMATION:55])>0)
												For ($_l_QualitiesIndex; 1; Records in selection:C76([INFORMATION:55]))
													[INFORMATION:55]QualityRecordID:16:=0
													DB_SaveRecord(->[INFORMATION:55])
													AA_CheckFileUnlockedByTableNUM(Table:C252(->[INFORMATION:55]))
													NEXT RECORD:C51([INFORMATION:55])
												End for 
											End if 
											USE SET:C118("ApplySet2")
										End if 
										
										DB_lockFile(->[INFORMATION:55])
										APPLY TO SELECTION:C70([INFORMATION:55]; [INFORMATION:55]Group:2:=$_t_GroupName)
										
										AA_CheckFileUnlockedByTableNUM(Table:C252(->[INFORMATION:55]))
										DelayTicks(30)
									Until (Records in set:C195("LockedSet")=0)
								End if 
								USE SET:C118("ApplySet")
								If (In transaction:C397)
									QUERY SELECTION:C341([INFORMATION:55]; [INFORMATION:55]QualityRecordID:16=0)
									If (Records in selection:C76([INFORMATION:55])>0)
										For ($_l_QualitiesIndex; 1; Records in selection:C76([INFORMATION:55]))
											[INFORMATION:55]QualityRecordID:16:=0
											DB_SaveRecord(->[INFORMATION:55])
											AA_CheckFileUnlockedByTableNUM(Table:C252(->[INFORMATION:55]))
											NEXT RECORD:C51([INFORMATION:55])
										End for 
									End if 
									USE SET:C118("ApplySet")
								End if 
								
								DB_lockFile(->[INFORMATION:55])
								APPLY TO SELECTION:C70([INFORMATION:55]; [INFORMATION:55]SubGroup:6:=$_t_SubGroupName)
								
								AA_CheckFileUnlockedByTableNUM(Table:C252(->[INFORMATION:55]))
								If (Records in set:C195("LockedSet")>0)
									Repeat 
										USE SET:C118("LockedSet")
										If (In transaction:C397)
											CREATE SET:C116([INFORMATION:55]; "ApplySet2")
											QUERY SELECTION:C341([INFORMATION:55]; [INFORMATION:55]QualityRecordID:16=0)
											If (Records in selection:C76([INFORMATION:55])>0)
												For ($_l_QualitiesIndex; 1; Records in selection:C76([INFORMATION:55]))
													[INFORMATION:55]QualityRecordID:16:=0
													DB_SaveRecord(->[INFORMATION:55])
													AA_CheckFileUnlockedByTableNUM(Table:C252(->[INFORMATION:55]))
													NEXT RECORD:C51([INFORMATION:55])
												End for 
											End if 
											USE SET:C118("ApplySet2")
										End if 
										
										DB_lockFile(->[INFORMATION:55])
										APPLY TO SELECTION:C70([INFORMATION:55]; [INFORMATION:55]SubGroup:6:=$_t_SubGroupName)
										
										AA_CheckFileUnlockedByTableNUM(Table:C252(->[INFORMATION:55]))
										DelayTicks(30)
									Until (Records in set:C195("LockedSet")=0)
								End if 
							End if 
							
							UNLOAD RECORD:C212([INFORMATION:55])
							READ ONLY:C145([INFORMATION:55])
							//put other relation fields in here
							
					End case 
					UNLOAD RECORD:C212([LIST_ITEMS:95])
					$0:=True:C214
					
				End if 
			End if 
		End if 
		
End case 
ERR_MethodTrackerReturn("ProcessService_ListItems"; $_t_oldMethodName)