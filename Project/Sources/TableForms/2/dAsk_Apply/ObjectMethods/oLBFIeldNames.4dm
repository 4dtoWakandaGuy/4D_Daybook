If (False:C215)
	//object Name: [COMPANIES]dAsk_Apply.oLBFIeldNames
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/08/2012 00:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DU_lb_FieldNames;0)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_2DFieldNumbers;0)
	//ARRAY LONGINT(AA_l_aListitemIDs;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldTypes;0)
	//ARRAY TEXT(AA_at_ListItems;0)
	//ARRAY TEXT(DU_at_ChangedValue;0)
	//ARRAY TEXT(DU_at_FieldChangeTypes;0)
	//ARRAY TEXT(SVS_at_PreviewTypeN;0)
	C_BOOLEAN:C305($_bo_Found; $_bo_NoLook)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_FieldNumber; $_l_FieldType; $_l_Index; $_l_ItemNumber; $_l_Row; $_l_TablePosition; vNo)
	C_TEXT:C284($_t_ChangedValue; $_t_FieldType; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dAsk_Apply.oLBFIeldNames"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		LISTBOX GET CELL POSITION:C971(DU_lb_FieldNames; $_l_Column; $_l_Row)
		If ($_l_Row>0)
			Case of 
				: ($_l_Column=3)
					EDIT ITEM:C870(DU_at_ChangedValue; $_l_Row)
					
			End case 
			$_l_TablePosition:=Find in array:C230(<>DB_al_TableNums; VNO)
			ARRAY TEXT:C222(AA_at_ListItems; 0)
			ARRAY LONGINT:C221(AA_l_aListitemIDs; 0)
			
			If (SVS_at_PreviewTypeN{$_l_Row}#"FF:@")
				$_l_FieldNumber:=<>SYS_al_2DFieldNumbers{$_l_TablePosition}{$_l_Row}
				READ ONLY:C145([x_ListUsage:112])
				QUERY:C277([x_ListUsage:112]; [x_ListUsage:112]x_TableID:3=vNo; *)
				QUERY:C277([x_ListUsage:112];  & ; [x_ListUsage:112]x_FieldID:4=$_l_FieldNumber)
				
				If (Records in selection:C76([x_ListUsage:112])>0)
					If ([x_ListUsage:112]x_ListID:2>0)
						//there is an associated list so load it
						AA_LoadListbyID([x_ListUsage:112]x_ListID:2; ->AA_at_ListItems; ->AA_l_aListitemIDs; False:C215)
					End if 
					
				End if 
			End if 
		End if 
		
	: ($_l_event=On Data Change:K2:15)
		LISTBOX GET CELL POSITION:C971(DU_lb_FieldNames; $_l_Column; $_l_Row)
		If ($_l_Row>0)
			Case of 
				: ($_l_Column=2)
					$_l_TablePosition:=Find in array:C230(DU_at_FieldChangeTypes; DU_at_FieldChangeTypes{$_l_Row})
					If ($_l_TablePosition<0)
						DU_at_FieldChangeTypes{$_l_Row}:=DU_at_FieldChangeTypes{1}
					Else 
						$_l_TablePosition:=Find in array:C230(<>DB_al_TableNums; VNO)
						If (SVS_at_PreviewTypeN{$_l_Row}#"FF:@")
							$_l_FieldNumber:=<>SYS_al_2DFieldNumbers{$_l_TablePosition}{SVS_at_PreviewTypeN}
							GET FIELD PROPERTIES:C258(vNo; $_l_FieldNumber; $_l_FieldType)
							
							Case of 
									//
								: (($_l_FieldType=1) | ($_l_FieldType=8) | ($_l_FieldType=9) | ($_l_FieldType=11))
									Case of 
										: (DU_at_FieldChangeTypes{$_l_Row}="Add to End") | (DU_at_FieldChangeTypes{$_l_Row}="Add to Date")
											DU_at_FieldChangeTypes{$_l_Row}:="Add to Value"
										: (DU_at_FieldChangeTypes{$_l_Row}="Add to Start") | (DU_at_FieldChangeTypes{$_l_Row}="Subtract from Date")
											DU_at_FieldChangeTypes{$_l_Row}:="Subtract from Value"
										: (DU_at_FieldChangeTypes{$_l_Row}="Change Flag")
											DU_at_FieldChangeTypes{$_l_Row}:="Add to Value"
										: (DU_at_FieldChangeTypes{$_l_Row}="Remove String")
											DU_at_FieldChangeTypes{$_l_Row}:="Subtract from Value"
											
									End case 
									
								: ($_l_FieldType=4)
									Case of 
										: (DU_at_FieldChangeTypes{$_l_Row}="Add to End") | (DU_at_FieldChangeTypes{$_l_Row}="Add to Value")
											DU_at_FieldChangeTypes{$_l_Row}:="Add to Date"
										: (DU_at_FieldChangeTypes{$_l_Row}="Add to Start") | (DU_at_FieldChangeTypes{$_l_Row}="Subtract from Value")
											DU_at_FieldChangeTypes{$_l_Row}:="Subtract from Date"
										: (DU_at_FieldChangeTypes{$_l_Row}="Change Flag")
											DU_at_FieldChangeTypes{$_l_Row}:="Add to Date"
										: (DU_at_FieldChangeTypes{$_l_Row}="Remove String")
											DU_at_FieldChangeTypes{$_l_Row}:="Subtract from Date"
									End case 
									
								: ($_l_FieldType=6)
									Case of 
										: (DU_at_FieldChangeTypes{$_l_Row}="Add to End") | (DU_at_FieldChangeTypes{$_l_Row}="Add to Value") | (DU_at_FieldChangeTypes{$_l_Row}="Add to Date")
											DU_at_FieldChangeTypes{$_l_Row}:="Change Flag"
										: (DU_at_FieldChangeTypes{$_l_Row}="Add to Start") | (DU_at_FieldChangeTypes{$_l_Row}="Subtract from Value")
											DU_at_FieldChangeTypes{$_l_Row}:="Change Flag"
										: (DU_at_FieldChangeTypes{$_l_Row}="Remove String")
											DU_at_FieldChangeTypes{$_l_Row}:="Change Flag"
									End case 
									
								Else 
									Case of 
										: (DU_at_FieldChangeTypes{$_l_Row}="Add to Date") | (DU_at_FieldChangeTypes{$_l_Row}="Add to Value")
											DU_at_FieldChangeTypes{$_l_Row}:="Add to End"
										: (DU_at_FieldChangeTypes{$_l_Row}="Subtract from Date") | (DU_at_FieldChangeTypes{$_l_Row}="Subtract from Value")
											DU_at_FieldChangeTypes{$_l_Row}:="Subtract from Start"
										: (DU_at_FieldChangeTypes{$_l_Row}="Change Flag")
											DU_at_FieldChangeTypes{$_l_Row}:="Add to End"
											
									End case 
									
									
							End case 
							
							
							
							
						Else 
							$_l_FieldType:=Find in array:C230(<>FUR_at_CustomFieldNames{$_l_TablePosition}; Substring:C12(SVS_at_PreviewTypeN{$_l_Row}; 4; 99))
							$_t_FieldType:=Substring:C12(<>FUR_at_CustomFieldTypes{$_l_TablePosition}{$_l_FieldType}; 1; 1)
							Case of 
									//
								: ($_t_FieldType="N")
									Case of 
										: (DU_at_FieldChangeTypes{$_l_Row}="Add to End") | (DU_at_FieldChangeTypes{$_l_Row}="Add to Date")
											DU_at_FieldChangeTypes{$_l_Row}:="Add to Value"
										: (DU_at_FieldChangeTypes{$_l_Row}="Add to Start") | (DU_at_FieldChangeTypes{$_l_Row}="Subtract from Date")
											DU_at_FieldChangeTypes{$_l_Row}:="Subtract from Value"
										: (DU_at_FieldChangeTypes{$_l_Row}="Change Flag")
											DU_at_FieldChangeTypes{$_l_Row}:="Add to Value"
										: (DU_at_FieldChangeTypes{$_l_Row}="Remove String")
											DU_at_FieldChangeTypes{$_l_Row}:="Subtract from Value"
											
									End case 
									
									
								: ($_t_FieldType="D")
									Case of 
										: (DU_at_FieldChangeTypes{$_l_Row}="Add to End") | (DU_at_FieldChangeTypes{$_l_Row}="Add to Value")
											DU_at_FieldChangeTypes{$_l_Row}:="Add to Date"
										: (DU_at_FieldChangeTypes{$_l_Row}="Add to Start") | (DU_at_FieldChangeTypes{$_l_Row}="Subtract from Value")
											DU_at_FieldChangeTypes{$_l_Row}:="Subtract from Date"
										: (DU_at_FieldChangeTypes{$_l_Row}="Change Flag")
											DU_at_FieldChangeTypes{$_l_Row}:="Add to Date"
										: (DU_at_FieldChangeTypes{$_l_Row}="Remove String")
											DU_at_FieldChangeTypes{$_l_Row}:="Subtract from Date"
									End case 
									
									
								Else 
									Case of 
										: (DU_at_FieldChangeTypes{$_l_Row}="Add to Date") | (DU_at_FieldChangeTypes{$_l_Row}="Add to Value")
											DU_at_FieldChangeTypes{$_l_Row}:="Add to End"
										: (DU_at_FieldChangeTypes{$_l_Row}="Subtract from Date") | (DU_at_FieldChangeTypes{$_l_Row}="Subtract from Value")
											DU_at_FieldChangeTypes{$_l_Row}:="Subtract from Start"
										: (DU_at_FieldChangeTypes{$_l_Row}="Change Flag")
											DU_at_FieldChangeTypes{$_l_Row}:="Add to End"
											
									End case 
									
									
							End case 
							
						End if 
						
					End if 
					
					
				: ($_l_Column=3)
					If (DU_at_FieldChangeTypes{$_l_Row}#"None")
						$_l_TablePosition:=Find in array:C230(<>DB_al_TableNums; VNO)
						If (SVS_at_PreviewTypeN{$_l_Row}#"FF:@")
							$_l_FieldNumber:=<>SYS_al_2DFieldNumbers{$_l_TablePosition}{SVS_at_PreviewTypeN}
							GET FIELD PROPERTIES:C258(vNo; $_l_FieldNumber; $_l_FieldType)
							
							Case of 
									//
								: (($_l_FieldType=1) | ($_l_FieldType=8) | ($_l_FieldType=9) | ($_l_FieldType=11))
									DU_at_ChangedValue{$_l_Row}:=String:C10(Num:C11(DU_at_ChangedValue{$_l_Row}))
									
								: ($_l_FieldType=4)
									DU_at_ChangedValue{$_l_Row}:=String:C10(Date:C102(DU_at_ChangedValue{$_l_Row}))
									
								: ($_l_FieldType=6)
									Case of 
										: (DU_at_ChangedValue{$_l_Row}="1")
											DU_at_ChangedValue{$_l_Row}:="1"
										: (DU_at_ChangedValue{$_l_Row}="TRUE")
											DU_at_ChangedValue{$_l_Row}:="TRUE"
										: (DU_at_ChangedValue{$_l_Row}="YES")
											DU_at_ChangedValue{$_l_Row}:="TRUE"
										: (DU_at_ChangedValue{$_l_Row}="0")
											DU_at_ChangedValue{$_l_Row}:="0"
										: (DU_at_ChangedValue{$_l_Row}="FALSE")
											DU_at_ChangedValue{$_l_Row}:="FALSE"
										: (DU_at_ChangedValue{$_l_Row}="NO")
											DU_at_ChangedValue{$_l_Row}:="FALSE"
									End case 
								Else 
									
									
							End case 
							
						Else 
							$_l_FieldType:=Find in array:C230(<>FUR_at_CustomFieldNames{$_l_TablePosition}; Substring:C12(SVS_at_PreviewTypeN{$_l_Row}; 4; 99))
							$_t_FieldType:=Substring:C12(<>FUR_at_CustomFieldTypes{$_l_TablePosition}{$_l_FieldType}; 1; 1)
							Case of 
									//
								: ($_t_FieldType="N")
									DU_at_ChangedValue{$_l_Row}:=String:C10(Num:C11(DU_at_ChangedValue{$_l_Row}))
									
								: ($_t_FieldType="D")
									DU_at_ChangedValue{$_l_Row}:=String:C10(Date:C102(DU_at_ChangedValue{$_l_Row}))
									
								Else 
									
									
							End case 
							
						End if 
						
						$_t_ChangedValue:=DU_at_ChangedValue{$_l_Row}
						If ($_t_ChangedValue#"")
							If (Size of array:C274(AA_at_ListItems)>0)
								$_bo_Found:=False:C215
								$_bo_NoLook:=False:C215
								If (Length:C16($_t_ChangedValue)=1)
									If (Character code:C91($_t_ChangedValue)=64)
										$_bo_NoLook:=True:C214
									End if 
								End if 
								If (Not:C34($_bo_NoLook))
									For ($_l_Index; 1; Size of array:C274(AA_at_ListItems))
										If (AA_at_ListItems{$_l_Index}=$_t_ChangedValue+"@")
											DU_at_ChangedValue{$_l_Row}:=AA_at_ListItems{$_l_Index}
											$_bo_Found:=True:C214
										End if 
									End for 
								End if 
								If ($_bo_Found=False:C215)
									//The value is not found so select from the list...
									HIDE WINDOW:C436
									$_l_ItemNumber:=AA_ListSelector(->AA_at_ListItems; "Select Item")
									SHOW WINDOW:C435
									
									
								End if 
							End if 
						End if 
						
					Else 
						Gen_Alert("Set the change type first")
						DU_at_ChangedValue{$_l_Row}:=""
					End if 
					
			End case 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dAsk_Apply.oLBFIeldNames"; $_t_oldMethodName)
