If (False:C215)
	//Project Form Method Name:      CONFIG_TABLE
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/09/2012 12:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(TAB_ab_FieldData;0)
	//ARRAY LONGINT(DB_al_DisplayFieldType;0)
	//ARRAY LONGINT(DB_al_FieldNumber;0)
	//ARRAY LONGINT(DB_al_FieldWidth;0)
	//ARRAY LONGINT(TAB_AL_HighlightedSelection;0;0)
	//ARRAY LONGINT(TAB_al_RecordsSelection;0;0)
	//ARRAY POINTER(DB_aptr_ConfigPtrs;0)
	//ARRAY TEXT(DB_at_DisplayFieldName;0)
	//ARRAY TEXT(TAB_at_PagingTabs;0)
	C_BOOLEAN:C305($_bo_FieldInvisible; $_bo_FieldUnique; $_bo_newLevel; DB_bo_NoLoad; $_bo_FieldIndexed; $_bo_FieldInvisible; $_bo_FieldUnique; $_bo_newLevel; DB_bo_NoLoad)
	C_LONGINT:C283($_l_CutOff; $_l_Event; $_l_FieldIndex; $_l_FieldLength; $_l_FieldType; $_l_IntegerCount; $_l_Jump; $_l_LastFIeld; $_l_MaxPerTab; $_l_MaxRecords; $_l_offset)
	C_LONGINT:C283($_l_ReuseLevel; $_l_Start; $_l_Tabs; DB_l_DisplayTable; DB_l_Offset; TAB_l_CurrentSelected; TAB_l_MaxPerTab; $_l_ColumnNumber; $_l_CutOff; $_l_Event; $_l_FieldIndex)
	C_LONGINT:C283($_l_FieldLength; $_l_FieldType; $_l_IntegerCount; $_l_Jump; $_l_LastFIeld; $_l_MaxPerTab; $_l_MaxRecords; $_l_MaxTabs; $_l_offset; $_l_ReuseLevel; $_l_Start)
	C_LONGINT:C283($_l_Tabs; DB_l_DisplayTable; DB_l_Offset; TAB_l_CurrentSelected; TAB_l_MaxPerTab)
	C_POINTER:C301($_ptr_Table; $_ptr_Field; $_ptr_Table)
	C_TEXT:C284($_t_FormName; $_t_FormReference; $_t_oldMethodName; $_t_Plural; $_t_Single; $_t_TableName; $_t_FieldName; $_t_FormName; $_t_FormReference; $_t_oldMethodName; $_t_Plural)
	C_TEXT:C284($_t_Single; $_t_TableName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FM [projectForm]/CONFIG_TABLE/{formMethod}"; Form event code:C388)

$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		//TRACE
		
		If (DB_l_DisplayTable>0)
			ARRAY TEXT:C222(DB_at_DisplayFieldName; 0)
			ARRAY LONGINT:C221(DB_al_DisplayFieldType; 0)
			ARRAY LONGINT:C221(DB_al_FieldWidth; 0)
			ARRAY LONGINT:C221(DB_al_FieldNumber; 0)
			If (Is table number valid:C999(DB_l_DisplayTable))
				$_l_LastFIeld:=Get last field number:C255(DB_l_DisplayTable)
				For ($_l_FieldIndex; 1; $_l_LastFIeld)
					If (Is field number valid:C1000(DB_l_DisplayTable; $_l_FieldIndex))
						$_t_FieldName:=Field name:C257(DB_l_DisplayTable; $_l_FieldIndex)
						GET FIELD PROPERTIES:C258(DB_l_DisplayTable; $_l_FieldIndex; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
						If ($_l_FieldType#Is BLOB:K8:12)
							
							APPEND TO ARRAY:C911(DB_at_DisplayFieldName; $_t_FieldName)
							APPEND TO ARRAY:C911(DB_al_DisplayFieldType; $_l_FieldType)
							APPEND TO ARRAY:C911(DB_al_FieldNumber; $_l_FieldIndex)
							APPEND TO ARRAY:C911(DB_al_FieldWidth; 0)
							Case of 
								: ($_l_FieldType=Is text:K8:3)
									
									DB_al_FieldWidth{Size of array:C274(DB_al_FieldWidth)}:=250
								: ($_l_FieldType=Is alpha field:K8:1)
									
									DB_al_FieldWidth{Size of array:C274(DB_al_FieldWidth)}:=10*$_l_FieldLength
								: ($_l_FieldType=Is longint:K8:6)
									
									DB_al_FieldWidth{Size of array:C274(DB_al_FieldWidth)}:=100
								: ($_l_FieldType=Is real:K8:4)
									
									DB_al_FieldWidth{Size of array:C274(DB_al_FieldWidth)}:=150
								: ($_l_FieldType=Is longint:K8:6)
									
									DB_al_FieldWidth{Size of array:C274(DB_al_FieldWidth)}:=100
									
								Else 
									DB_al_FieldWidth{Size of array:C274(DB_al_FieldWidth)}:=100
							End case 
							If ($_bo_FieldInvisible) | ($_t_FieldName="X@")
								If (Not:C34(User in group:C338(Current user:C182; "Designer")))
									DB_al_FieldWidth{Size of array:C274(DB_al_FieldWidth)}:=0
								End if 
							End if 
							
						End if 
					End if 
				End for 
			End if 
			$_t_TableName:=Table name:C256(DB_l_DisplayTable)
			
			$_t_FormReference:=("0"*Num:C11(DB_l_DisplayTable<10))+("0"*Num:C11(DB_l_DisplayTable<100))+("0"*Num:C11(DB_l_DisplayTable<1000))+String:C10(DB_l_DisplayTable)+"99"
			
			READ WRITE:C146([LIST_LAYOUTS:96])
			$_l_ColumnNumber:=0
			For ($_l_FieldIndex; 1; Size of array:C274(DB_at_DisplayFieldName))
				QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$_t_FormReference; *)
				QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Table_Number:2=DB_l_DisplayTable; *)
				QUERY:C277([LIST_LAYOUTS:96];  & ; [LIST_LAYOUTS:96]Field_Number:3=DB_al_FieldNumber{$_l_FieldIndex})
				If (Records in selection:C76([LIST_LAYOUTS:96])=0)
					$_l_ColumnNumber:=Layouts_Create($_t_FormReference; DB_l_DisplayTable; DB_al_FieldNumber{$_l_FieldIndex}; DB_at_DisplayFieldName{$_l_FieldIndex}; ""; DB_al_FieldWidth{$_l_FieldIndex}; $_l_FieldIndex; False:C215; False:C215; "")
					
				Else 
					[LIST_LAYOUTS:96]Title:4:=DB_at_DisplayFieldName{$_l_FieldIndex}
					[LIST_LAYOUTS:96]Width:5:=DB_al_FieldWidth{$_l_FieldIndex}
					[LIST_LAYOUTS:96]Order:7:=$_l_FieldIndex
					SAVE RECORD:C53([LIST_LAYOUTS:96])
				End if 
				
			End for 
			ARRAY POINTER:C280(DB_aptr_ConfigPtrs; 0)
			$_bo_newLevel:=True:C214
			$_l_ReuseLevel:=0
			$_ptr_Field:=Field:C253(DB_l_DisplayTable; DB_al_FieldNumber{1})
			
			
			If ($_t_TableName[[Length:C16($_t_TableName)]]="S")
				$_t_Plural:=$_t_TableName
				$_t_Single:=Substring:C12($_t_TableName; 1; Length:C16($_t_TableName)-1)
			Else 
				$_t_Plural:=$_t_TableName+"S"
				$_t_Single:=$_t_TableName
			End if 
			$_t_FormName:=$_t_TableName+"_In"
			//TRACE
			DB_l_Offset:=1000
			
			
			$_ptr_Table:=Table:C252(DB_l_DisplayTable)
			$_l_MaxRecords:=Records in table:C83($_ptr_Table->)
			If (False:C215)
				If ($_l_MaxRecords<1000)
					OBJECT SET VISIBLE:C603(*; "oPagesTab"; False:C215)
					ALL RECORDS:C47($_ptr_Table->)
					ARRAY TEXT:C222(TAB_at_PagingTabs; 1)
					ARRAY LONGINT:C221(TAB_al_RecordsSelection; 1; 0)
					LONGINT ARRAY FROM SELECTION:C647($_ptr_Table->; TAB_al_RecordsSelection{1})
					TAB_l_CurrentSelected:=1
					OBJECT SET VISIBLE:C603(*; "oMaxPerTab@"; False:C215)
					
				Else 
					OBJECT SET VISIBLE:C603(*; "oPagesTab"; True:C214)
					Case of 
						: ($_l_MaxRecords<10000)  //Break into groups of 1000
							
							$_l_CutOff:=100
						: ($_l_MaxRecords<100000)  //Break into groups of 10000
							
							$_l_CutOff:=1000
						: ($_l_MaxRecords<1000000)  //Break into groups of 1000000
							
							$_l_CutOff:=10000
						: ($_l_MaxRecords<10000000)  //Break into groups of 1000000
							
							$_l_CutOff:=100000
						: ($_l_MaxRecords<100000000)  //Break into groups of 100000
							
							$_l_CutOff:=1000000
							
						Else 
							$_l_CutOff:=10000000
							
					End case 
					$_l_MaxPerTab:=$_l_CutOff
					
					$_l_MaxTabs:=20
					Repeat 
						$_l_Tabs:=$_l_MaxRecords/$_l_MaxPerTab
						If ($_l_Tabs>$_l_MaxTabs)
							$_l_MaxPerTab:=$_l_MaxPerTab+$_l_CutOff
						End if 
					Until ($_l_Tabs<=$_l_MaxTabs)
					$_l_Jump:=$_l_MaxPerTab-1
					$_l_IntegerCount:=(Int:C8($_l_MaxRecords/$_l_MaxPerTab))
					If ($_l_IntegerCount<$_l_MaxRecords)
						$_l_offset:=1
					Else 
						$_l_offset:=0
					End if 
					ARRAY TEXT:C222(TAB_at_PagingTabs; $_l_IntegerCount+$_l_offset)
					ARRAY LONGINT:C221(TAB_al_RecordsSelection; $_l_IntegerCount+$_l_offset; 0)
					ARRAY LONGINT:C221(TAB_AL_HighlightedSelection; $_l_IntegerCount+$_l_offset; 0)
					TAB_l_MaxPerTab:=$_l_MaxPerTab
					OBJECT SET VISIBLE:C603(*; "oMaxPerTab@"; True:C214)
					$_l_Start:=1
					For ($_l_FieldIndex; 1; Size of array:C274(TAB_at_PagingTabs))
						If (($_l_Start+$_l_Jump)>=$_l_MaxRecords)
							If ($_l_Start>1)
								TAB_at_PagingTabs{$_l_FieldIndex}:=String:C10($_l_Start+1)+"-"+String:C10($_l_MaxRecords)
							Else 
								TAB_at_PagingTabs{$_l_FieldIndex}:=String:C10($_l_Start)+"-"+String:C10($_l_MaxRecords)
							End if 
							ALL RECORDS:C47($_ptr_Table->)
							CREATE SET:C116($_ptr_Table->; "$Temp")
							If ($_l_Start>1)
								ALL RECORDS:C47($_ptr_Table->)
								REDUCE SELECTION:C351($_ptr_Table->; $_l_Start-1)
								CREATE SET:C116($_ptr_Table->; "$Temp2")
								DIFFERENCE:C122("$Temp"; "$Temp2"; "$Temp")
								USE SET:C118("$Temp")
							End if 
							LONGINT ARRAY FROM SELECTION:C647($_ptr_Table->; TAB_al_RecordsSelection{$_l_FieldIndex})
						Else 
							If ($_l_Start>1)
								TAB_at_PagingTabs{$_l_FieldIndex}:=String:C10($_l_Start)+"-"+String:C10($_l_Start+$_l_Jump)
							Else 
								TAB_at_PagingTabs{$_l_FieldIndex}:=String:C10($_l_Start)+"-"+String:C10($_l_Start+$_l_Jump)
							End if 
							ALL RECORDS:C47($_ptr_Table->)
							REDUCE SELECTION:C351($_ptr_Table->; $_l_Start+$_l_Jump)
							CREATE SET:C116($_ptr_Table->; "$Temp")
							If ($_l_Start>1)
								ALL RECORDS:C47($_ptr_Table->)
								
								REDUCE SELECTION:C351($_ptr_Table->; $_l_Start-1)
								CREATE SET:C116($_ptr_Table->; "$Temp2")
								DIFFERENCE:C122("$Temp"; "$Temp2"; "$Temp")
								
								USE SET:C118("$Temp")
							End if 
							LONGINT ARRAY FROM SELECTION:C647($_ptr_Table->; TAB_al_RecordsSelection{$_l_FieldIndex})
						End if 
						$_l_Start:=$_l_Start+$_l_Jump+1
					End for 
					TAB_l_CurrentSelected:=1
					//``
					//Now set up the listbox area(array Based)
					//Note not using
					
					
					
				End if 
			Else 
				ALL RECORDS:C47($_ptr_Table->)
				LISTBOX SET TABLE SOURCE:C1013(TAB_ab_FieldData; DB_l_DisplayTable)
			End if 
			
			LBi_ArrDefFill(->DB_aptr_ConfigPtrs; ->TAB_ab_FieldData; $_ptr_Field; $_ptr_Field; "411111000"; $_t_FormName; 99; $_t_Plural; $_t_Single; ""; $_bo_newLevel; $_l_ReuseLevel)
			DB_l_Offset:=100
			LBi_LoadSetup(->DB_aptr_ConfigPtrs; "B"; 3)
			LB_Setdividers(->TAB_ab_FieldData; Light grey:K11:13; 32)  //Both black
			LB_SetColours(->TAB_ab_FieldData; Black:K11:16; Grey:K11:15; Light grey:K11:13)
			
			
		Else 
			CANCEL:C270
		End if 
		
End case 
ERR_MethodTrackerReturn("FM CONFIG_TABLE"; $_t_oldMethodName)
