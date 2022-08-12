//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Load Fields
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
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_2DFieldNumbers;0;0)
	//ARRAY LONGINT(<>SYS_al_RecStateRestriction;0;0)
	//ARRAY LONGINT(<>SYS_al_RecStateSortOrder;0;0)
	//ARRAY LONGINT(<>SYS_al_TableRecordNameField;0)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	//ARRAY TEXT(<>SYS_at_2DFieldNames;0;0)
	//ARRAY TEXT(<>SYS_at_CurrentTableFieldNames;0)
	//ARRAY TEXT(<>SYS_at_RecStateAbbrev;0;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0;0)
	//ARRAY TEXT(<>SYS_at_RecStateNames;0;0)
	C_BOOLEAN:C305(<>SYS_bo_FieldNamesLoaded; $_bo_FieldIndexed; $_bo_FieldInvisible; $_bo_FieldUnique; $_bo_invisible)
	C_LONGINT:C283(<>DB_at_TableNamesMacro; $_l_CountFields; $_l_CurrentRow; $_l_DeleteRows; $_l_FIeldElement; $_l_FieldLength; $_l_FieldsIndex; $_l_FieldType; $_l_LastTableNumber; $_l_TableIndex; $_l_tableNumPosition)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Load Fields")
If (Not:C34(<>SYS_bo_FieldNamesLoaded))
	//Load Fields - see also States Load
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
				GET TABLE PROPERTIES:C687($_l_TableIndex; $_bo_invisible)  //BSW 1/10/02 SG/BSW Broken bookings printout
				
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
ERR_MethodTrackerReturn("Load Fields"; $_t_oldMethodName)