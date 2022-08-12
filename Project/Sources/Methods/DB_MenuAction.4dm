//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_MenuAction
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:25
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>DB_at_CombnBaranditem;0)
	//ARRAY TEXT(<>DB_at_MenuBarNameMod;0)
	//ARRAY TEXT(<>DB_at_MENUBARNAMESTD;0)
	//ARRAY TEXT(<>DB_at_ModifiedItemName;0)
	//ARRAY TEXT(<>DB_at_StandarditemName;0)
	ARRAY TEXT:C222($_at_MenuItemIDS; 0)
	ARRAY TEXT:C222($_at_MenuItems; 0)
	ARRAY TEXT:C222($_at_MenuReferences; 0)
	ARRAY TEXT:C222($_at_MenuTitles; 0)
	C_BOOLEAN:C305(<>DB_bo_MenuSwappedNamesInited; <>SYS_bo_QuitCalled; $6)
	C_LONGINT:C283($_l_ArraySize; $_l_Index; $_l_Index2; $_l_MenuAction; $_l_MenuItem; $_l_MenuItemItem; $_l_menuitemposition; $_l_MenusCount; $_l_MenuTitlePosition; $_l_NumberofMenuItems; $_l_Offset)
	C_LONGINT:C283($_l_Process; $_l_ProcessState; $_l_Size2; $_l_SlashPosition; $_l_StartPoint; $3; $5)
	C_TEXT:C284($_t_AlternativeItemName; $_t_CheckMark; $_t_ItemName; $_t_itemStr; $_t_MenuBarName; $_t_menuMark; $_t_MenuReference; $_t_MenuTitle; $_t_oldMethodName; $_t_SetMenuReference; $1)
	C_TEXT:C284($2; $4; $7)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DB_MenuAction")

If (Not:C34(<>SYS_bo_QuitCalled))  //Seems to be causing freezing up while quiting from clients
	
	//This method will carry out actions to menus
	While (Semaphore:C143("$menuChanging"))
		DelayTicks(7)
	End while 
	While (Semaphore:C143("$SettingMenuItem"))
		DelayTicks(2)
	End while 
	If (Not:C34(<>DB_bo_MenuSwappedNamesInited))
		ARRAY TEXT:C222(<>DB_at_CombnBaranditem; 0)
		
		ARRAY TEXT:C222(<>DB_at_MENUBARNAMESTD; 0)
		ARRAY TEXT:C222(<>DB_at_MenuBarNameMod; 0)
		ARRAY TEXT:C222(<>DB_at_StandarditemName; 0)
		ARRAY TEXT:C222(<>DB_at_ModifiedItemName; 0)
		<>DB_bo_MenuSwappedNamesInited:=True:C214
	End if 
	If (Count parameters:C259>=2)
		$_t_MenuBarName:=$1
		$_t_ItemName:=$2
		$_t_AlternativeItemName:=$_t_ItemName
		If (Count parameters:C259>=1)
			$_l_MenuAction:=$3
		End if 
		If (Count parameters:C259>=4)
			$_t_menuMark:=$4
		End if 
		If (Count parameters:C259>=5)
			
			$_l_Process:=$5
		Else 
			
			$_l_Process:=Current process:C322
		End if 
		If (Count parameters:C259>=6)  // is this an appended menu?
			$_l_Offset:=2049*(Num:C11($6))  //will return 0 or 2049
		Else 
			$_l_Offset:=2049
		End if 
		If (Count parameters:C259>=7)
			$_t_MenuReference:=$7
		End if 
		
		If ($_t_MenuBarName#"")
			
			$_l_menuitemposition:=Find in array:C230(<>DB_at_CombnBaranditem; $_t_MenuBarName+"_"+$_t_ItemName)
			If ($_l_menuitemposition<0)
				APPEND TO ARRAY:C911(<>DB_at_CombnBaranditem; $_t_MenuBarName+"_"+$_t_ItemName)
				APPEND TO ARRAY:C911(<>DB_at_MENUBARNAMESTD; $_t_MenuBarName)
				APPEND TO ARRAY:C911(<>DB_at_StandarditemName; $_t_ItemName)
				APPEND TO ARRAY:C911(<>DB_at_MenuBarNameMod; "")
				APPEND TO ARRAY:C911(<>DB_at_ModifiedItemName; "")
				$_l_menuitemposition:=Size of array:C274(<>DB_at_CombnBaranditem)
			End if 
			
			//pass in $_t_MenuBarName the name of the menu
			//and $_t_ItemName the name of the menu item
			//and $_l_MenuAction(longint)
			//and $_l_MenuAction the 'string' action
			//Action 1-SET MENU ITEM string
			//ACTION 2=ENABLE
			//ACTION 3=DISABLE
			If (Count parameters:C259>=3)
				//If (Application type#4D Server )  `bsw 26/09/03 This was crashing server with type 2
				
				If (Count parameters:C259>=4)
					If ($_l_MenuAction=4)
						If (Is macOS:C1572)
							$_t_CheckMark:=Char:C90(Num:C11($_t_menuMark))
						Else 
							$_t_CheckMark:="²"
						End if 
					Else 
						$_t_CheckMark:=""
					End if 
					
					If (<>DB_at_ModifiedItemName{$_l_menuitemposition}#$_t_ItemName) & (<>DB_at_ModifiedItemName{$_l_menuitemposition}#"")
						If ($_l_MenuAction#1)
							$_t_AlternativeItemName:=<>DB_at_ModifiedItemName{$_l_menuitemposition}
						End if 
					End if 
					$_l_SlashPosition:=Position:C15("/"; $_t_ItemName)
					If ($_l_SlashPosition>0)
						$_t_ItemName:=Substring:C12($_t_ItemName; 1; $_l_SlashPosition-1)
					End if 
					$_l_ProcessState:=Process state:C330($_l_Process)
					If ($_l_ProcessState>=0)
						If ($_l_Process>0)
							$_l_MenusCount:=Count menus:C404($_l_Process)
							ARRAY TEXT:C222($_at_MenuTitles; 0)
							ARRAY TEXT:C222($_at_MenuReferences; 0)
							If (Count parameters:C259>=7)
								GET MENU ITEMS:C977($_t_MenuReference; $_at_MenuTitles; $_at_MenuReferences)
								$_l_MenusCount:=Size of array:C274($_at_MenuTitles)
							End if 
							If ($_l_MenusCount=1)
								$_l_MenusCount:=10
							End if 
							$_l_MenuItem:=0
							$_l_MenuItemItem:=0
							$_l_MenuTitlePosition:=Find in array:C230($_at_MenuTitles; $_t_MenuBarName)
							If ($_l_MenuTitlePosition>0)
								$_l_StartPoint:=$_l_MenuTitlePosition
							Else 
								$_l_StartPoint:=1
							End if 
							$_t_SetMenuReference:=""
							$_l_MenuItem:=1+$_l_Offset
							$_t_MenuTitle:=Get menu title:C430($_l_MenuItem; $_l_Process)
							If ($_t_MenuTitle="")
								$_l_Offset:=0
							End if 
							For ($_l_Index; $_l_StartPoint; $_l_MenusCount)
								$_l_ProcessState:=Process state:C330($_l_Process)
								If ($_l_ProcessState>=0)
									If ($_l_Index<=Count menus:C404($_l_Process))
										If (Size of array:C274($_at_MenuTitles)=0)
											$_l_MenuItem:=$_l_Index+$_l_Offset
											$_t_MenuTitle:=Get menu title:C430($_l_MenuItem; $_l_Process)
											
										Else 
											$_l_MenuItem:=$_l_Index
											$_t_MenuTitle:=$_at_MenuTitles{$_l_Index}
										End if 
										If ($_t_MenuTitle=$_t_MenuBarName)  //this is the menu
											If (Size of array:C274($_at_MenuTitles)=0)
												$_t_SetMenuReference:=""
											Else 
												$_t_SetMenuReference:=$_at_MenuReferences{$_l_Index}
											End if 
											If ($_t_ItemName#"")
												ARRAY TEXT:C222($_at_MenuItems; 0)
												ARRAY TEXT:C222($_at_MenuItemIDS; 0)
												If (Size of array:C274($_at_MenuReferences)=0)
													$_l_NumberofMenuItems:=Count menu items:C405($_l_MenuItem; $_l_Process)
												Else 
													GET MENU ITEMS:C977($_at_MenuReferences{$_l_Index}; $_at_MenuItems; $_at_MenuItemIDS)
													$_l_NumberofMenuItems:=Size of array:C274($_at_MenuItems)
												End if 
												If (Size of array:C274($_at_MenuItems)>0)
													$_l_StartPoint:=Find in array:C230($_at_MenuItems; $_t_ItemName)
													If ($_l_StartPoint<0)
														$_l_StartPoint:=1
													End if 
												Else 
													$_l_StartPoint:=1
												End if 
												
												For ($_l_Index2; $_l_StartPoint; $_l_NumberofMenuItems)
													$_l_ProcessState:=Process state:C330($_l_Process)
													If ($_l_ProcessState>=0)
														If (Size of array:C274($_at_MenuTitles)=0)
															$_l_ArraySize:=Count menus:C404($_l_Process)
														Else 
															$_l_ArraySize:=Size of array:C274($_at_MenuTitles)
														End if 
														If ($_l_ArraySize>=$_l_Index)  //When quiting 4D itself can clear the menu so this becomes a count of 0 which gets an error
															If (Size of array:C274($_at_MenuItems)=0)
																$_l_Size2:=Count menu items:C405($_l_MenuItem; $_l_Process)
															Else 
																$_l_Size2:=Size of array:C274($_at_MenuItems)
															End if 
															If ($_l_Index2<=$_l_Size2)
																If (Size of array:C274($_at_MenuItems)=0)
																	$_t_itemStr:=Get menu item:C422($_l_MenuItem; $_l_Index2; $_l_Process)
																Else 
																	$_t_itemStr:=$_at_MenuItems{$_l_Index2}
																End if 
																If ($_t_itemStr=$_t_ItemName) | ($_t_itemStr=$_t_AlternativeItemName)
																	$_l_MenuItemItem:=$_l_Index2
																	$_l_Index2:=$_l_Index2+14
																End if 
															End if 
														Else 
															$_l_Index2:=$_l_NumberofMenuItems
														End if 
													Else 
														$_l_Index2:=$_l_NumberofMenuItems
													End if 
												End for 
											Else 
												$_l_MenuItemItem:=-1
											End if 
											$_l_Index:=$_l_MenusCount
										End if 
									End if 
								Else 
									$_l_Index:=$_l_MenusCount
								End if 
							End for 
							If ($_l_MenuItem>0) & ($_l_MenuItemItem#0)
								If ($_l_MenuItemItem=-1)
									//disable the whole menu
									$_l_MenuItemItem:=0
								End if 
								$_l_ProcessState:=Process state:C330($_l_Process)
								If ($_l_ProcessState>=0)
									Case of 
										: ($_l_MenuAction=1)  //set a menu item string
											
											<>DB_at_ModifiedItemName{$_l_menuitemposition}:=$_t_menuMark
											If ($_t_SetMenuReference#"")
												SET MENU ITEM:C348($_t_SetMenuReference; $_l_MenuItemItem; $_t_menuMark; $_l_Process)
												
											Else 
												SET MENU ITEM:C348($_l_MenuItem; $_l_MenuItemItem; $_t_menuMark; $_l_Process)
											End if 
										: ($_l_MenuAction=2)  //Enable a menu item
											If ($_t_SetMenuReference#"")
												ENABLE MENU ITEM:C149($_t_SetMenuReference; $_l_MenuItemItem; $_l_Process)
											Else 
												ENABLE MENU ITEM:C149($_l_MenuItem; $_l_MenuItemItem; $_l_Process)
											End if 
										: ($_l_MenuAction=3)  //disable a menu item
											If ($_t_SetMenuReference#"")
												DISABLE MENU ITEM:C150($_t_SetMenuReference; $_l_MenuItemItem; $_l_Process)
											Else 
												DISABLE MENU ITEM:C150($_l_MenuItem; $_l_MenuItemItem; $_l_Process)
											End if 
										: ($_l_MenuAction=4)  //set a menu item mark
											//TRACE
											If ($_t_menuMark#"")
												//$_t_oldMethodName2:=ERR_MethodTracker ("SettingMenuMarkinprocess"+String($_l_Process))
												If ($_t_SetMenuReference#"")
													SET MENU ITEM MARK:C208($_t_SetMenuReference; $_l_MenuItemItem; $_t_CheckMark; $_l_Process)
												Else 
													SET MENU ITEM MARK:C208($_l_MenuItem; $_l_MenuItemItem; $_t_CheckMark; $_l_Process)
												End if 
											Else 
												If ($_t_SetMenuReference#"")
													SET MENU ITEM MARK:C208($_t_SetMenuReference; $_l_MenuItemItem; ""; $_l_Process)
													
												Else 
													SET MENU ITEM MARK:C208($_l_MenuItem; $_l_MenuItemItem; ""; $_l_Process)
												End if 
											End if 
									End case 
								End if 
							End if 
						End if 
					End if 
					//End if
				End if 
			End if 
		End if 
	End if 
	CLEAR SEMAPHORE:C144("$SettingMenuItem")
	CLEAR SEMAPHORE:C144("$menuChanging")
	
End if 
ERR_MethodTrackerReturn("DB_MenuAction"; $_t_oldMethodName)