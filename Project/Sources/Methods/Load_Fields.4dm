//%attributes = {}
If (False:C215)
	//Project Method Name:      Load_Fields
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  15/11/2010 19:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($_CurrentField)
	//C_UNKNOWN($i)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_2DFieldNumbers;0;0)
	//ARRAY LONGINT(<>SYS_al_RecStateRestriction;0;0)
	//ARRAY LONGINT(<>SYS_al_RecStateSortOrder;0;0)
	//ARRAY LONGINT(<>SYS_al_TableRecordNameField;0)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	ARRAY LONGINT:C221($_al_2DFieldNumbers; 0; 0)
	ARRAY LONGINT:C221($_al_RecordNameField; 0)
	ARRAY LONGINT:C221($_al_RecStateRestriction; 0; 0)
	ARRAY LONGINT:C221($_al_RecStateSortOrder; 0; 0)
	ARRAY LONGINT:C221($_al_TableNumbers; 0)
	ARRAY LONGINT:C221($_al_TableRecordNameField; 0)
	ARRAY LONGINT:C221($_al_TableUniqueField; 0)
	ARRAY OBJECT:C1221($_aobj_ManyRelations; 0; 0)
	ARRAY OBJECT:C1221($_aobj_OneRelations; 0; 0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	//ARRAY TEXT(<>SYS_at_2DFieldNames;0;0)
	//ARRAY TEXT(<>SYS_at_CurrentTableFieldNames;0)
	//ARRAY TEXT(<>SYS_at_RecStateAbbrev;0;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0;0)
	//ARRAY TEXT(<>SYS_at_RecStateNames;0;0)
	ARRAY TEXT:C222($_at_2SFieldNames; 0; 0)
	ARRAY TEXT:C222($_at_Export; 0)
	ARRAY TEXT:C222($_at_PrimeKeys; 0)
	ARRAY TEXT:C222($_at_RecStateAbbrev; 0; 0)
	ARRAY TEXT:C222($_at_RecStateCodes; 0; 0)
	ARRAY TEXT:C222($_at_RecStateNames; 0; 0)
	ARRAY TEXT:C222($_at_TableNames; 0)
	ARRAY TEXT:C222($_at_TestFields; 0)
	ARRAY TEXT:C222($_at_TestTableNames; 0)
	C_BOOLEAN:C305(<>SYS_bo_FieldNamesLoaded; $_bo_FieldIndexed; $_bo_FieldInvisible; $_bo_FieldUnique; $_bo_invisible)
	C_COLLECTION:C1488($_col_FieldsCollection; $_col_ThisTableFields)
	C_LONGINT:C283(<>DB_at_TableNamesMacro; $_l_CountFields; $_l_CurrentRow; $_l_DeleteRows; $_l_FIeldElement; $_l_FieldLength; $_l_FieldNumber; $_l_Fields; $_l_FieldsIndex; $_l_FieldType; $_l_GetFields)
	C_LONGINT:C283($_l_LastTableNumber; $_l_LoadTable; $_l_TableIndex; $_l_TableNumber; $_l_tableNumPosition; $_l_Tables)
	C_OBJECT:C1216($_obj_Class; $_obj_DataReturn; $_Obj_Datastore; $_obj_Field; $_obj_Infos; $_obj_ThisTable; $1)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306($_ti_Document)
End if 
//Code Starts Here
If (Count parameters:C259=0)  // & (False)
	$_t_oldMethodName:=ERR_MethodTracker("Load_Fields")
	If (Not:C34(<>SYS_bo_FieldNamesLoaded))
		//Load_Fields - see also States Load
		While (Semaphore:C143("$LoadFields"))
			DelayTicks(2)
		End while 
		While (Semaphore:C143("$InitingFields"))
			DelayTicks(2)
		End while 
		$_l_LastTableNumber:=Get last table number:C254
		ARRAY TEXT:C222(<>DB_at_TableNames; $_l_LastTableNumber)
		ARRAY LONGINT:C221(<>DB_al_TableNums; $_l_LastTableNumber)
		<>DB_at_TableNamesMacro:=0
		
		If (<>SYS_bo_FieldNamesLoaded=False:C215)
			ARRAY TEXT:C222(<>SYS_at_2DFieldNames; $_l_LastTableNumber; 0)
			ARRAY LONGINT:C221(<>SYS_al_2DFieldNumbers; $_l_LastTableNumber; 0)
			ARRAY TEXT:C222(<>SYS_at_RecStateCodes; $_l_LastTableNumber; 0)  //see States Load
			ARRAY LONGINT:C221(<>SYS_al_RecStateSortOrder; $_l_LastTableNumber; 0)
			ARRAY TEXT:C222(<>SYS_at_RecStateNames; $_l_LastTableNumber; 0)
			ARRAY TEXT:C222(<>SYS_at_RecStateAbbrev; $_l_LastTableNumber; 0)
			ARRAY LONGINT:C221(<>SYS_al_RecStateRestriction; $_l_LastTableNumber; 0)
			
			ARRAY LONGINT:C221(<>SYS_al_TableUniqueField; $_l_LastTableNumber)  //define these now so at least they will be 0
			ARRAY LONGINT:C221(<>SYS_al_TableRecordNameField; $_l_LastTableNumber)  //if they're used before finishing this proc
			If (Current user:C182#"DESIGNER")
				$_bo_invisible:=False:C215
			End if 
			
			$_l_TableIndex:=0
			$_l_CurrentRow:=0
			For ($_l_TableIndex; 1; $_l_LastTableNumber; 1)
				If (Is table number valid:C999($_l_TableIndex))
					
					//   ◊Files{$_l_TableIndex}:=Table name($_l_TableIndex)
					GET TABLE PROPERTIES:C687($_l_TableIndex; $_bo_invisible)
					
					//I got 63 which casued error 53
					If (Current user:C182="DESIGNER")
						If (False:C215)
							$_bo_invisible:=False:C215
						End if 
					Else 
						//Temporary
						If (Table name:C256($_l_TableIndex)="SF_@") | (Table name:C256($_l_TableIndex)="X@")
							$_bo_invisible:=True:C214
						End if 
						
					End if 
					If (Not:C34($_bo_invisible))
						$_l_CurrentRow:=$_l_CurrentRow+1
						<>DB_at_TableNames{$_l_CurrentRow}:=Table name:C256($_l_TableIndex)
						<>DB_al_TableNums{$_l_CurrentRow}:=$_l_TableIndex
						If (($_l_TableIndex=15) | ($_l_TableIndex=66) | ($_l_TableIndex=97))
							If (Size of array:C274(<>SYS_at_2DFieldNames{$_l_CurrentRow})<1)
								INSERT IN ARRAY:C227(<>SYS_at_2DFieldNames{$_l_CurrentRow}; (Size of array:C274(<>SYS_at_2DFieldNames{$_l_CurrentRow}))+1; 1)
								INSERT IN ARRAY:C227(<>SYS_al_2DFieldNumbers{$_l_CurrentRow}; (Size of array:C274(<>SYS_al_2DFieldNumbers{$_l_CurrentRow}))+1; 1)
							Else 
								
							End if 
							//ARRAY STRING(45;◊Fields{$_l_CurrentRow};1)
							<>SYS_at_2DFieldNames{$_l_CurrentRow}{1}:="Hidden"
							<>SYS_al_2DFieldNumbers{$_l_CurrentRow}{1}:=1
							
							If ($_l_TableIndex=97)
								<>DB_at_TableNames{$_l_CurrentRow}:="N/A"
							End if 
						Else 
							$_l_CountFields:=Get last field number:C255($_l_TableIndex)
							//If $_l_CountFields>Size of array(◊Fields{$_l_CurrentRow}))
							If (Size of array:C274(<>SYS_at_2DFieldNames{$_l_CurrentRow})<$_l_CountFields)
								INSERT IN ARRAY:C227(<>SYS_at_2DFieldNames{$_l_CurrentRow}; Size of array:C274(<>SYS_at_2DFieldNames{$_l_CurrentRow})+1; $_l_CountFields-Size of array:C274(<>SYS_at_2DFieldNames{$_l_CurrentRow}))
								INSERT IN ARRAY:C227(<>SYS_al_2DFieldNumbers{$_l_CurrentRow}; Size of array:C274(<>SYS_al_2DFieldNumbers{$_l_CurrentRow})+1; $_l_CountFields-Size of array:C274(<>SYS_al_2DFieldNumbers{$_l_CurrentRow}))
							End if 
							//End if
							$_l_FieldsIndex:=0
							$_l_FIeldElement:=0
							//MESSAGE("Table"+◊Files{$_l_CurrentRow})
							For ($_l_FieldsIndex; 1; $_l_CountFields)
								If (Is field number valid:C1000($_l_TableIndex; $_l_FieldsIndex))
									GET FIELD PROPERTIES:C258($_l_TableIndex; $_l_FieldsIndex; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
									If (Current user:C182="DESIGNER")
										If (False:C215)
											$_bo_FieldInvisible:=False:C215
										End if 
										
									End if 
									If (Not:C34($_bo_FieldInvisible)) & (Not:C34($_l_FieldType=7))
										//MESSAGE("Table"+◊Files{$_l_CurrentRow}+"Field"+Field name($_l_TableIndex;$_l_FieldsIndex))
										$_l_FIeldElement:=$_l_FIeldElement+1
										<>SYS_at_2DFieldNames{$_l_CurrentRow}{$_l_FIeldElement}:=Field name:C257($_l_TableIndex; $_l_FieldsIndex)
										<>SYS_al_2DFieldNumbers{$_l_CurrentRow}{$_l_FIeldElement}:=$_l_FieldsIndex
									End if 
									If ($_bo_FieldUnique)
										<>SYS_al_TableUniqueField{$_l_CurrentRow}:=$_l_FIeldElement
									Else 
									End if 
								End if 
							End for 
							//If ($_l_FIeldElement>Size of array(Size of array(◊Fields{$_l_CurrentRow}))
							If ($_l_FIeldElement<Size of array:C274(<>SYS_al_2DFieldNumbers{$_l_CurrentRow}))
								$_l_DeleteRows:=Size of array:C274(<>SYS_al_2DFieldNumbers{$_l_CurrentRow})-$_l_FIeldElement
								DELETE FROM ARRAY:C228(<>SYS_al_2DFieldNumbers{$_l_CurrentRow}; Size of array:C274(<>SYS_al_2DFieldNumbers{$_l_CurrentRow})+1-$_l_DeleteRows; $_l_DeleteRows)
								DELETE FROM ARRAY:C228(<>SYS_at_2DFieldNames{$_l_CurrentRow}; Size of array:C274(<>SYS_at_2DFieldNames{$_l_CurrentRow})+1-$_l_DeleteRows; $_l_DeleteRows)
								
							End if 
							//ARRAY STRING(45;◊Fields{$_l_CurrentRow};$_l_FIeldElement)
							//ARRAY LONGINT(◊Fields_ID{$_l_CurrentRow};$_l_FIeldElement)
							//end if
						End if 
					End if 
				End if 
			End for 
			ARRAY TEXT:C222(<>DB_at_TableNames; $_l_CurrentRow)
			ARRAY LONGINT:C221(<>DB_al_TableNums; $_l_CurrentRow)
			
			//NOW JUST REMEMBER THERE ARE at the end of THE 2D arrays
			//AND REMEMBER the ◊files array is offset
			
			$_l_tableNumPosition:=Find in array:C230(<>DB_al_TableNums; 11)
			If ($_l_tableNumPosition>0)
				If (Current user:C182#"DESIGNER")
					<>SYS_at_2DFieldNames{$_l_tableNumPosition}{13}:="Hidden"
				End if 
			End if 
			<>DB_at_TableNames:=1
			COPY ARRAY:C226(<>SYS_at_2DFieldNames{1}; <>SYS_at_CurrentTableFieldNames)
			<>SYS_at_CurrentTableFieldNames:=1
			
			//load in unique fields
			
			For ($_l_TableIndex; 2; $_l_LastTableNumber)
				If (<>SYS_al_TableUniqueField{$_l_TableIndex}=0)
					<>SYS_al_TableUniqueField{$_l_TableIndex}:=1
				End if 
				
			End for 
			<>SYS_al_TableUniqueField{1}:=Field:C253(->[CONTACTS:1]Contact_Code:2)
			<>SYS_al_TableUniqueField{2}:=Field:C253(->[COMPANIES:2]Company_Code:1)
			<>SYS_al_TableUniqueField{12}:=Field:C253(->[DIARY:12]Diary_Code:3)
			<>SYS_al_TableUniqueField{15}:=0
			<>SYS_al_TableUniqueField{17}:=Field:C253(->[CONTRACTS:17]Contract_Code:3)
			<>SYS_al_TableUniqueField{20}:=Field:C253(->[SERVICE_CALLS:20]Call_Code:4)
			<>SYS_al_TableUniqueField{24}:=3
			<>SYS_al_TableUniqueField{25}:=27
			<>SYS_al_TableUniqueField{27}:=0
			<>SYS_al_TableUniqueField{28}:=12
			<>SYS_al_TableUniqueField{29}:=0
			<>SYS_al_TableUniqueField{30}:=10
			<>SYS_al_TableUniqueField{32}:=2
			<>SYS_al_TableUniqueField{34}:=0
			<>SYS_al_TableUniqueField{38}:=0
			<>SYS_al_TableUniqueField{39}:=Field:C253(->[INVOICES:39]Invoice_Number:1)
			//zGen_Alert(String(◊aFileUnique{39}))
			
			
			<>SYS_al_TableUniqueField{42}:=0
			<>SYS_al_TableUniqueField{44}:=2
			<>SYS_al_TableUniqueField{47}:=0
			<>SYS_al_TableUniqueField{48}:=0
			<>SYS_al_TableUniqueField{49}:=0
			<>SYS_al_TableUniqueField{50}:=0
			<>SYS_al_TableUniqueField{51}:=10
			<>SYS_al_TableUniqueField{55}:=9
			<>SYS_al_TableUniqueField{56}:=0
			<>SYS_al_TableUniqueField{57}:=2
			<>SYS_al_TableUniqueField{58}:=0
			<>SYS_al_TableUniqueField{62}:=7
			<>SYS_al_TableUniqueField{63}:=0
			<>SYS_al_TableUniqueField{64}:=2
			<>SYS_al_TableUniqueField{66}:=0
			<>SYS_al_TableUniqueField{67}:=8
			<>SYS_al_TableUniqueField{70}:=0
			<>SYS_al_TableUniqueField{72}:=2
			<>SYS_al_TableUniqueField{77}:=0
			<>SYS_al_TableUniqueField{78}:=0
			<>SYS_al_TableUniqueField{79}:=0
			<>SYS_al_TableUniqueField{81}:=0
			<>SYS_al_TableUniqueField{82}:=0
			<>SYS_al_TableUniqueField{83}:=0
			<>SYS_al_TableUniqueField{86}:=0
			<>SYS_al_TableUniqueField{88}:=0
			<>SYS_al_TableUniqueField{90}:=0
			<>SYS_al_TableUniqueField{91}:=0
			<>SYS_al_TableUniqueField{93}:=0
			<>SYS_al_TableUniqueField{94}:=0
			<>SYS_al_TableUniqueField{95}:=0
			<>SYS_al_TableUniqueField{96}:=0
			<>SYS_al_TableUniqueField{97}:=0
			<>SYS_al_TableUniqueField{98}:=0
			<>SYS_al_TableUniqueField{99}:=0  //zero cos otherwise the Furth Fields will be avail for itself
			<>SYS_al_TableUniqueField{100}:=0
			
			//load in Reference fields - ie 'Name' fields
			ARRAY LONGINT:C221(<>SYS_al_TableRecordNameField; $_l_LastTableNumber)
			<>SYS_al_TableRecordNameField{1}:=5
			<>SYS_al_TableRecordNameField{2}:=2
			<>SYS_al_TableRecordNameField{3}:=2
			<>SYS_al_TableRecordNameField{4}:=2
			<>SYS_al_TableRecordNameField{5}:=2
			<>SYS_al_TableRecordNameField{6}:=2
			<>SYS_al_TableRecordNameField{7}:=2
			<>SYS_al_TableRecordNameField{8}:=2
			<>SYS_al_TableRecordNameField{9}:=2
			<>SYS_al_TableRecordNameField{10}:=2
			<>SYS_al_TableRecordNameField{11}:=2
			<>SYS_al_TableRecordNameField{12}:=1
			<>SYS_al_TableRecordNameField{13}:=2
			<>SYS_al_TableRecordNameField{14}:=2
			<>SYS_al_TableRecordNameField{16}:=3
			<>SYS_al_TableRecordNameField{17}:=1
			<>SYS_al_TableRecordNameField{18}:=2
			<>SYS_al_TableRecordNameField{19}:=2
			<>SYS_al_TableRecordNameField{20}:=1
			<>SYS_al_TableRecordNameField{21}:=2
			<>SYS_al_TableRecordNameField{22}:=2
			<>SYS_al_TableRecordNameField{23}:=2
			<>SYS_al_TableRecordNameField{24}:=1
			<>SYS_al_TableRecordNameField{25}:=2
			<>SYS_al_TableRecordNameField{26}:=2
			<>SYS_al_TableRecordNameField{28}:=1
			<>SYS_al_TableRecordNameField{30}:=12
			<>SYS_al_TableRecordNameField{31}:=2
			<>SYS_al_TableRecordNameField{32}:=3
			<>SYS_al_TableRecordNameField{33}:=2
			<>SYS_al_TableRecordNameField{35}:=2
			<>SYS_al_TableRecordNameField{36}:=2
			<>SYS_al_TableRecordNameField{37}:=2
			<>SYS_al_TableRecordNameField{39}:=2
			<>SYS_al_TableRecordNameField{40}:=2
			<>SYS_al_TableRecordNameField{41}:=2
			<>SYS_al_TableRecordNameField{43}:=2
			<>SYS_al_TableRecordNameField{44}:=3
			<>SYS_al_TableRecordNameField{45}:=2
			<>SYS_al_TableRecordNameField{46}:=2
			<>SYS_al_TableRecordNameField{51}:=1
			<>SYS_al_TableRecordNameField{52}:=2
			<>SYS_al_TableRecordNameField{53}:=2
			<>SYS_al_TableRecordNameField{54}:=2
			<>SYS_al_TableRecordNameField{55}:=7
			<>SYS_al_TableRecordNameField{57}:=1
			<>SYS_al_TableRecordNameField{59}:=5
			<>SYS_al_TableRecordNameField{60}:=2
			<>SYS_al_TableRecordNameField{61}:=2
			<>SYS_al_TableRecordNameField{62}:=1
			<>SYS_al_TableRecordNameField{64}:=3
			<>SYS_al_TableRecordNameField{65}:=2
			<>SYS_al_TableRecordNameField{67}:=1
			<>SYS_al_TableRecordNameField{68}:=2
			<>SYS_al_TableRecordNameField{69}:=2
			<>SYS_al_TableRecordNameField{71}:=2
			<>SYS_al_TableRecordNameField{73}:=2
			<>SYS_al_TableRecordNameField{74}:=2
			<>SYS_al_TableRecordNameField{75}:=2
			<>SYS_al_TableRecordNameField{76}:=2
			<>SYS_al_TableRecordNameField{80}:=2
			<>SYS_al_TableRecordNameField{84}:=2
			<>SYS_al_TableRecordNameField{85}:=2
			<>SYS_al_TableRecordNameField{87}:=2
			<>SYS_al_TableRecordNameField{89}:=2
			<>SYS_al_TableRecordNameField{92}:=2
			<>SYS_al_TableRecordNameField{101}:=5
			<>SYS_bo_FieldNamesLoaded:=True:C214
		End if 
		CLEAR SEMAPHORE:C144("$InitingFields")
		
		CLEAR SEMAPHORE:C144("$LoadFields")
	End if 
	
Else 
	//$_obj_DataReturn:=New object
	
	$_obj_DataReturn:=$1
	$_Obj_Datastore:=ds:C1482
	
	ARRAY TEXT:C222($_at_Export; 0)
	If (Not:C34($_Obj_Datastore=Null:C1517))
		OB GET PROPERTY NAMES:C1232($_Obj_Datastore; $_at_TestTableNames)
		$_l_LastTableNumber:=Size of array:C274($_at_TestTableNames)
		ARRAY TEXT:C222($_at_TableNames; 0)  //$_l_LastTableNumber)
		ARRAY LONGINT:C221($_al_TableNumbers; 0)  //$_l_LastTableNumber)
		ARRAY TEXT:C222($_at_PrimeKeys; 0)  //$_l_LastTableNumber)
		ARRAY LONGINT:C221($_al_RecordNameField; 0)  // $_l_LastTableNumber)
		ARRAY OBJECT:C1221($_aobj_ManyRelations; 0; 0)  // $_l_LastTableNumber; 0)
		ARRAY OBJECT:C1221($_aobj_OneRelations; 0; 0)  // $_l_LastTableNumber; 0)
		
		ARRAY TEXT:C222($_at_2SFieldNames; 0; 0)
		ARRAY LONGINT:C221($_al_2DFieldNumbers; 0; 0)
		//ARRAY TEXT($_at_RecStateCodes; $_l_LastTableNumber; 0)  //see States Load
		//ARRAY LONGINT($_al_RecStateSortOrder; $_l_LastTableNumber; 0)
		//ARRAY TEXT($_at_RecStateNames; $_l_LastTableNumber; 0)
		//ARRAY TEXT($_at_RecStateAbbrev; $_l_LastTableNumber; 0)
		//ARRAY LONGINT($_al_RecStateRestriction; $_l_LastTableNumber; 0)
		//ARRAY LONGINT($_al_TableUniqueField; $_l_LastTableNumber)  //define these now so at least they will be 0
		//ARRAY LONGINT($_al_TableRecordNameField; $_l_LastTableNumber)  //if they're used before finishing this proc
		
		
		$_l_CurrentRow:=0
		If (Not:C34($_obj_DataReturn.loadTable=Null:C1517))
			$_l_LoadTable:=$_obj_DataReturn.loadTable
			
		End if 
		For ($_l_Tables; 1; Size of array:C274($_at_TestTableNames))
			$_obj_Infos:=ds:C1482[$_at_TestTableNames{$_l_Tables}].getInfo()
			
			GET TABLE PROPERTIES:C687($_obj_Infos.tableNumber; $_bo_invisible)
			If ($_l_LoadTable=0) | ($_l_LoadTable=$_obj_Infos.tableNumber)
				If (Current user:C182="DESIGNER")
					$_bo_invisible:=False:C215
				Else 
					
					If ($_at_TableNames{$_l_Tables}="SF_@") | ($_at_TableNames{$_l_Tables}="X@")
						$_bo_invisible:=True:C214
					End if 
					
				End if 
				If (Not:C34($_bo_invisible))
					$_l_CurrentRow:=$_l_CurrentRow+1
					$_obj_Class:=ds:C1482[$_at_TestTableNames{$_l_Tables}]
					OB GET PROPERTY NAMES:C1232($_obj_Class; $_at_TestFields)
					
					APPEND TO ARRAY:C911($_at_PrimeKeys; $_obj_Infos.primaryKey)
					APPEND TO ARRAY:C911($_al_TableNumbers; $_obj_Infos.tableNumber)
					APPEND TO ARRAY:C911($_at_TableNames; $_at_TestTableNames{$_l_Tables})  //APPEND TO ARRAY($_al_TableNumbers; $_l_Tables)
					APPEND TO ARRAY:C911($_al_RecordNameField; 0)
					
					INSERT IN ARRAY:C227($_aobj_ManyRelations; Size of array:C274($_aobj_ManyRelations)+1; 1)
					INSERT IN ARRAY:C227($_aobj_OneRelations; Size of array:C274($_aobj_OneRelations)+1; 1)
					INSERT IN ARRAY:C227($_at_2SFieldNames; Size of array:C274($_at_2SFieldNames)+1; 1)
					INSERT IN ARRAY:C227($_al_2DFieldNumbers; Size of array:C274($_al_2DFieldNumbers)+1; 1)
					$_CurrentField:=0
					For ($_l_Fields; 1; Size of array:C274($_at_TestFields))
						$_obj_Field:=ds:C1482[$_at_TestTableNames{$_l_Tables}][$_at_TestFields{$_l_Fields}]
						Case of 
							: ($_obj_Field.fieldType=42)  //RelatedEntities
								//TRACE
								If ($_obj_Field.kind="relatedEntities")
									APPEND TO ARRAY:C911($_aobj_ManyRelations{$_l_CurrentRow}; $_obj_Field)
									//$_t_Json:=JSON Stringify($_obj_Field)
									//If (Position("1"; $_t_Json)>0) | (Position("2"; $_t_Json)>0) | (Position("3"; $_t_Json)>0) | (Position("4"; $_t_Json)>0) | (Position("5"; $_t_Json)>0) | (Position("6"; $_t_Json)>0) | (Position("7"; $_t_Json)>0) | (Position("8"; $_t_Json)>0) | (Position("9"; $_t_Json)>0)
									
									//APPEND TO ARRAY($_at_Export; $_at_TestTableNames{$_l_Tables}+Char(9)+$_t_Json)
								Else 
									//TRACE
									$_l_FieldNumber:=$_obj_Field.fieldNumber
									$_l_TableNumber:=$_obj_Infos.tableNumber
									GET FIELD PROPERTIES:C258($_l_TableNumber; $_l_FieldNumber; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
									
									If (Current user:C182="Designer")
										$_bo_FieldInvisible:=False:C215
									Else 
										
										If ($_obj_Field.name="SF_@") | ($_obj_Field.name="X@")
											$_bo_invisible:=True:C214
										End if 
										
									End if 
									
									If (Not:C34($_bo_FieldInvisible))
										$_CurrentField:=$_CurrentField+1
										APPEND TO ARRAY:C911($_at_2SFieldNames{$_l_CurrentRow}; $_obj_Field.name)
										APPEND TO ARRAY:C911($_al_2DFieldNumbers{$_l_CurrentRow}; $_obj_Field.fieldNumber)
										Case of 
											: ($_obj_Infos.tableNumber=1)
												If ($_obj_Field.name="Company_Name")
													$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
												End if 
											: ($_obj_Infos.tableNumber=198)
												If ($_obj_Field.name="Bank_Account_Number")
													$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
												End if 
											: ($_obj_Infos.tableNumber=32)
												If ($_obj_Field.name="ACCOUNTS")
													$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
												End if 
											: ($_obj_Infos.tableNumber=34)
												//no record 'name'
												
											Else 
												//TRACE
												
										End case 
										
									End if 
									
									
								End if 
							: ($_obj_Field.fieldType=38)  //RelatedEntity
								
								If ($_obj_Field.kind="relatedEntity")
									APPEND TO ARRAY:C911($_aobj_OneRelations{$_l_CurrentRow}; $_obj_Field)
									//$_t_Json:=JSON Stringify($_obj_Field)
									//If (Position("1"; $_t_Json)>0) | (Position("2"; $_t_Json)>0) | (Position("3"; $_t_Json)>0) | (Position("4"; $_t_Json)>0) | (Position("5"; $_t_Json)>0) | (Position("6"; $_t_Json)>0) | (Position("7"; $_t_Json)>0) | (Position("8"; $_t_Json)>0) | (Position("9"; $_t_Json)>0)
									
									//APPEND TO ARRAY($_at_Export; $_at_TestTableNames{$_l_Tables}+Char(9)+$_t_Json)
								Else 
									//TRACE
									$_l_FieldNumber:=$_obj_Field.fieldNumber
									$_l_TableNumber:=$_obj_Infos.tableNumber
									GET FIELD PROPERTIES:C258($_l_TableNumber; $_l_FieldNumber; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
									If (Current user:C182="Designer")
										$_bo_FieldInvisible:=False:C215
									Else 
										
										If ($_obj_Field.name="SF_@") | ($_obj_Field.name="X@")
											$_bo_invisible:=True:C214
										End if 
										
									End if 
									If (Not:C34($_bo_FieldInvisible))
										$_CurrentField:=$_CurrentField+1
										APPEND TO ARRAY:C911($_at_2SFieldNames{$_l_CurrentRow}; $_obj_Field.name)
										APPEND TO ARRAY:C911($_al_2DFieldNumbers{$_l_CurrentRow}; $_obj_Field.fieldNumber)
										
									End if 
									
									
								End if 
							Else 
								$_l_FieldNumber:=$_obj_Field.fieldNumber
								$_l_TableNumber:=$_obj_Infos.tableNumber
								GET FIELD PROPERTIES:C258($_l_TableNumber; $_l_FieldNumber; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
								If (Current user:C182="Designer")
									$_bo_FieldInvisible:=False:C215
								Else 
									
									If ($_obj_Field.name="SF_@") | ($_obj_Field.name="X@")
										$_bo_invisible:=True:C214
									End if 
									
								End if 
								
								If (Not:C34($_bo_FieldInvisible))
									$_CurrentField:=$_CurrentField+1
									APPEND TO ARRAY:C911($_at_2SFieldNames{$_l_CurrentRow}; $_obj_Field.name)
									APPEND TO ARRAY:C911($_al_2DFieldNumbers{$_l_CurrentRow}; $_obj_Field.fieldNumber)
									
								End if 
						End case 
						Case of 
							: ($_obj_Infos.tableNumber=1)
								If ($_obj_Field.name="Company_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=198)
								If ($_obj_Field.name="Bank_Account_Number")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=32)
								If ($_obj_Field.name="ACCOUNTS")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=34)
								//no record 'name'
							: ($_obj_Infos.tableNumber=157)
								//no record 'name'
								If ($_obj_Field.name="Analysis_Code")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=156)
								//no record 'name'
								If ($_obj_Field.name="Layer_Code")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=13)
								//no record 'name'
								If ($_obj_Field.name="Action_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=200)
								//no record 'name'
							: ($_obj_Infos.tableNumber=202)
								//no record 'name'
								If ($_obj_Field.name="Macro_Code")
									//$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=205)
								//no record 'name'
							: ($_obj_Infos.tableNumber=201)
								//no record 'name'
							: ($_obj_Infos.tableNumber=203)
								//no record 'name'
							: ($_obj_Infos.tableNumber=204)
								//no record 'name'
							: ($_obj_Infos.tableNumber=53)
								//no record 'name'
								If ($_obj_Field.name="Additional_Analysis_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=74)
								If ($_obj_Field.name="Format_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=36)
								If ($_obj_Field.name="Analysis_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=3)
								If ($_obj_Field.name="Area_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=108)
								If ($_obj_Field.name="Catalogue_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=125)
								//no record 'name'
							: ($_obj_Infos.tableNumber=213)
							: ($_obj_Infos.tableNumber=212)
							: ($_obj_Infos.tableNumber=199)
								//no record 'name'
							: ($_obj_Infos.tableNumber=188)
								//no record 'name'
							: ($_obj_Infos.tableNumber=190)
								//no record 'name'
							: ($_obj_Infos.tableNumber=110)
								//no record 'name'
							: ($_obj_Infos.tableNumber=109)
								//no record 'name'
							: ($_obj_Infos.tableNumber=133)
								//no record 'name'
							: ($_obj_Infos.tableNumber=136)
								//no record 'name'
							: ($_obj_Infos.tableNumber=10)  //PRODUCT_GROUPS 
								If ($_obj_Field.name="Group_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=11)  // PERSONNEL Name
							: ($_obj_Infos.tableNumber=111)  // X_LISTS 
								If ($_obj_Field.name="x_ListName")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
								
							: ($_obj_Infos.tableNumber=117)  // EW_ExportProjects 
								If ($_obj_Field.name="ProjectName")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=12)  // DIARY 
								If ($_obj_Field.name="Diary_Code")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=132)  // xCreditCardDetails 
								If ($_obj_Field.name="NameonCard")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=14)  // RESULTS 
								If ($_obj_Field.name="Result_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=152)  // SERVICE_CALLS_PRODUCTS 
								If ($_obj_Field.name="Product_Code")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=158)  // PURCHASE_INVOICE_ITEMS 
								If ($_obj_Field.name="PURCHASE_INVOICE_CODE")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=161)  // INVOICES_ITEMS 
								If ($_obj_Field.name="INVOICES_CODE")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=169)  // PURCHASE_ORDERS_ITEMS 
								If ($_obj_Field.name="PURCHASE_ORDERS_CODE")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=17)  // CONTRACTS 
								If ($_obj_Field.name="Contract_Code")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=19)  // CONTRACT_TYPES 
								If ($_obj_Field.name="Contract_Type_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=2)  // COMPANIES 
								If ($_obj_Field.name="Company_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=20)  // SERVICE_CALLS 
								If ($_obj_Field.name="Call_Code")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=209)  // WORKFLOW_Campaign 
								If ($_obj_Field.name="Campaign_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=22)  // PROBLEMS 
								If ($_obj_Field.name="Problem_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=23)  // SOLUTIONS 
								If ($_obj_Field.name="Solution_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=24)  // ORDERS 
								If ($_obj_Field.name="Order_Code")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=25)  // ORDER_ITEMS 
								If ($_obj_Field.name="Order_Code")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=26)  // JOBS 
								If ($_obj_Field.name="Job_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=28)  // PRICE_TABLE 
								If ($_obj_Field.name="Price_Code")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=30)  // TRANSACTION_BATCHES 
								If ($_obj_Field.name="Batch_Number")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=33)  // PERIODS 
								If ($_obj_Field.name="Period_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=35)  // TAX_CODES 
								If ($_obj_Field.name="Tax_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=37)  // PURCHASE_INVOICES 
								If ($_obj_Field.name="Purchase_Code")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=39)  // INVOICES 
								If ($_obj_Field.name="Invoice_Number")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=4)  // STATUS 
								If ($_obj_Field.name="Status_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=40)  // STOCK_MOVEMENTS
								If ($_obj_Field.name="Movement_Code")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=45)  // STAGES 
								If ($_obj_Field.name="Stage_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=46)  // TIME_BILLING_CATEGORIES 
								If ($_obj_Field.name="Category_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=47)  // JOB_STAGES 
								If ($_obj_Field.name="Stage_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=48)  // JOB PERSONNEL 
								If ($_obj_Field.name="Job_Code")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=5)  // TYPES 
								If ($_obj_Field.name="Type_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=50)  // POSTAL_CODES 
								If ($_obj_Field.name="Area_Code")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=51)  // WORKFLOW_CONTROL 
								If ($_obj_Field.name="WFControl_Code")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=52)  // PUBLICATIONS 
								If ($_obj_Field.name="Publication_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=54)  // CREDIT_STAGES 
								If ($_obj_Field.name="Stage_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=56)  // QUALITY_GROUPS 
								If ($_obj_Field.name="Group")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=57)  // PURCHASE_ORDERS 
								If ($_obj_Field.name="Purchase_Order_Number")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=6)  // SOURCES 
								If ($_obj_Field.name="Source_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=60)  // MOVEMENT_TYPES 
								If ($_obj_Field.name="Type_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=61)  // LOCATIONS 
								If ($_obj_Field.name="Location_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=65)  // JOB_TYPES 
								If ($_obj_Field.name="Type_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=7)  // DOCUMENTS 
								If ($_obj_Field.name="Heading")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=71)  // CURRENCIES 
								If ($_obj_Field.name="Currency_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=75)  // TERMINOLOGY 
								If ($_obj_Field.name="Terminology_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=76)  // LAYERS 
								If ($_obj_Field.name="Layer_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=8)  //PRODUCT_BRANDS 
								If ($_obj_Field.name="Brand_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=80)  // SCRIPTS 
								If ($_obj_Field.name="Script_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=84)  // HEADINGS 
								If ($_obj_Field.name="Heading_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=85)  // PICTURES 
								If ($_obj_Field.name="Picture_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=86)  // COMPONENTS 
								If ($_obj_Field.name="Component_Code")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=87)  // ROLES 
								If ($_obj_Field.name="Role_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=89)  //PROJECTS 
								If ($_obj_Field.name="Project_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=9)  //PRODUCTS 
								If ($_obj_Field.name="Product_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=90)  // TABLE_RECORD_STATES 
								If ($_obj_Field.name="Listing_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=92)  // PERSONNEL_GROUPS
								If ($_obj_Field.name="Group_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=93)  //SUBSCRIPTIONS 
								If ($_obj_Field.name="Subscription_OrderItem")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=93)  //SUBSCRIPTIONS 
								If ($_obj_Field.name="Subscription_Product")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=95)  //LIST_ITEMS 
								If ($_obj_Field.name="List_Entry")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=96)  //LIST_LAYOUTS 
								If ($_obj_Field.name="Layout_Reference")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
							: ($_obj_Infos.tableNumber=99)  //CUSTOM_FIELD_DEFINITiONS
								If ($_obj_Field.name=" Field_Name")
									$_al_RecordNameField{$_l_CurrentRow}:=$_obj_Field.fieldNumber
								End if 
								
							Else 
								//TRACE
								APPEND TO ARRAY:C911($_at_Export; String:C10($_obj_Infos.tableNumber)+" "+$_at_TestTableNames{$_l_Tables}+" "+$_obj_Field.name)
						End case 
						
						
					End for 
					SORT ARRAY:C229($_at_2SFieldNames{$_l_CurrentRow}; $_al_2DFieldNumbers{$_l_CurrentRow})  //sort the field names for this table
					
				End if 
			End if 
		End for 
		
		SORT ARRAY:C229($_at_TableNames; $_al_TableNumbers; $_at_PrimeKeys; $_al_RecordNameField; $_aobj_ManyRelations; $_aobj_OneRelations; $_at_2SFieldNames; $_al_2DFieldNumbers)
		
		If (False:C215)
			$_ti_Document:=Create document:C266(""; "TEXT")
			For ($i; 1; Size of array:C274($_at_Export))
				SEND PACKET:C103($_ti_Document; $_at_Export{$i}+Char:C90(13))
			End for 
		End if 
		
		If (Not:C34($_obj_DataReturn.tableNames=Null:C1517))
			ARRAY TO COLLECTION:C1563($_obj_DataReturn.tableNames; $_at_TableNames)
		End if 
		If (Not:C34($_obj_DataReturn.tableNumbers=Null:C1517))
			ARRAY TO COLLECTION:C1563($_obj_DataReturn.tableNumbers; $_al_TableNumbers)
		End if 
		If (Not:C34($_obj_DataReturn.primeKeys=Null:C1517))
			ARRAY TO COLLECTION:C1563($_obj_DataReturn.primeKeys; $_at_PrimeKeys)
		End if 
		If (Not:C34($_obj_DataReturn.fieldNames=Null:C1517))
			// to go from a 2D array means going to a COlLECTION of OBJECTS with each object being a colleciton of fields
			$_col_FieldsCollection:=New collection:C1472
			For ($_l_GetFields; 1; Size of array:C274($_at_TableNames))
				$_col_ThisTableFields:=New collection:C1472
				ARRAY TO COLLECTION:C1563($_col_ThisTableFields; $_at_2SFieldNames{$_l_GetFields})
				$_obj_ThisTable:=New object:C1471($_at_TableNames{$_l_GetFields}; $_col_ThisTableFields)
				$_obj_DataReturn.fieldNames.push($_obj_ThisTable)
			End for 
			
			//ARRAY TO COLLECTION($_obj_DataReturn.fieldNames; $_al_TableNumbers)
		End if 
		If (Not:C34($_obj_DataReturn.fieldNumbers=Null:C1517))
			// to go from a 2D array means going to a COlLECTION of OBJECTS with each object being a colleciton of fields
			$_col_FieldsCollection:=New collection:C1472
			For ($_l_GetFields; 1; Size of array:C274($_at_TableNames))
				$_col_ThisTableFields:=New collection:C1472
				ARRAY TO COLLECTION:C1563($_col_ThisTableFields; $_al_2DFieldNumbers{$_l_GetFields})
				$_obj_ThisTable:=New object:C1471($_at_TableNames{$_l_GetFields}; $_col_ThisTableFields)
				$_obj_DataReturn.fieldNumbers.push($_obj_ThisTable)
			End for 
			
			//ARRAY TO COLLECTION($_obj_DataReturn.fieldNames; $_al_TableNumbers)
		End if 
	End if 
End if 

ERR_MethodTrackerReturn("Load_Fields"; $_t_oldMethodName)
