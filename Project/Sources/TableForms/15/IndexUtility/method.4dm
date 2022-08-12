If (False:C215)
	//Table Form Method Name: [USER]IndexUtility
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY POINTER(<>CIM_aptr_FieldToProcess;0)
	C_BOOLEAN:C305($_bo_FieldIndexed; $_bo_HasIndex; DB_bo_NoLoad)
	C_LONGINT:C283(<>CIM_vlhlList; $_l_CountFields; $_l_FieldLength; $_l_FieldNumberIndex; $_l_FieldType; $_l_FormEvent; $_l_MenuCommand; $_l_MenuNumber; $_l_SublistReference; $_l_TableNumberIndex)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [USER].IndexUtility"; Form event code:C388)
//build a two-dimensional hierarchical list
//first level contains the tables and the second level contains the
//alpha indexed fields


$_l_FormEvent:=Form event code:C388


Case of 
	: ($_l_FormEvent=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "IndexUtility")
		
		DB_SetMenuBar(""; 110)
		$_l_MenuNumber:=3
		$_l_MenuCommand:=1
		DISABLE MENU ITEM:C150($_l_MenuNumber; $_l_MenuCommand)
		
		ARRAY POINTER:C280(<>CIM_aptr_FieldToProcess; 0)
		
		<>CIM_vlhlList:=New list:C375
		For ($_l_TableNumberIndex; 1; Get last table number:C254)
			If (Is table number valid:C999($_l_TableNumberIndex))
				
				If (Table name:C256($_l_TableNumberIndex)[[1]]="x")
					// skip it
				Else 
					$_bo_HasIndex:=False:C215
					$_l_CountFields:=Get last field number:C255($_l_TableNumberIndex)
					For ($_l_FieldNumberIndex; 1; $_l_CountFields)
						If (Is field number valid:C1000($_l_TableNumberIndex; $_l_FieldNumberIndex))
							
							GET FIELD PROPERTIES:C258($_l_TableNumberIndex; $_l_FieldNumberIndex; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed)
							If ($_bo_FieldIndexed)
								$_bo_HasIndex:=True:C214
								$_l_CountFields:=$_l_FieldNumberIndex
							End if 
						End if 
					End for 
					
					If ($_bo_HasIndex)
						$_l_SublistReference:=New list:C375
						
						For ($_l_FieldNumberIndex; 1; Get last field number:C255($_l_TableNumberIndex))
							GET FIELD PROPERTIES:C258($_l_TableNumberIndex; $_l_FieldNumberIndex; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed)
							If ($_bo_FieldIndexed)
								APPEND TO LIST:C376($_l_SublistReference; Field name:C257($_l_TableNumberIndex; $_l_FieldNumberIndex); ($_l_TableNumberIndex*1000)+$_l_FieldNumberIndex)
								SET LIST ITEM PROPERTIES:C386($_l_SublistReference; 0; False:C215; Plain:K14:1; 865)
							End if 
						End for 
						APPEND TO LIST:C376(<>CIM_vlhlList; Table name:C256($_l_TableNumberIndex); $_l_TableNumberIndex; $_l_SublistReference; False:C215)
						SET LIST ITEM PROPERTIES:C386(<>CIM_vlhlList; 0; False:C215; Plain:K14:1; 864)
					End if   // has an indexed field
				End if   // table name doesn't start with "x"
			End if 
		End for 
		
		SORT LIST:C391(<>CIM_vlhlList; >)
		
		//   $vlNumProcess:=New process("SEntryHelp_z";32*1024;"Help")
		
	: ($_l_FormEvent=On Unload:K2:2)
		//   ◊vbStop:=True
		
		$_l_MenuNumber:=3
		$_l_MenuCommand:=1
		ENABLE MENU ITEM:C149($_l_MenuNumber; $_l_MenuCommand)
		
		CLEAR LIST:C377(<>CIM_vlhlList; *)
End case 
ERR_MethodTrackerReturn("FM [USER].IndexUtility"; $_t_oldMethodName)
