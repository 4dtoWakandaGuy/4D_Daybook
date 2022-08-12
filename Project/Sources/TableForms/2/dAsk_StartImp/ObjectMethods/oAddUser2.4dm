If (False:C215)
	//object Method Name: Object Name:      [COMPANIES].dAsk_StartImp.oAddUser2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/08/2012 11:00
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(LAY_lb_Columns;0)
	//ARRAY BOOLEAN(LAY_lb_ColumnSettings;0)
	//ARRAY LONGINT(LAY_al_ColumnNumber;0)
	//ARRAY LONGINT(LAY_al_RecordNumbers;0)
	//ARRAY LONGINT(LL_al_FieldAccess;0)
	//ARRAY LONGINT(LL_al_FieldNos;0)
	//ARRAY LONGINT(LL_al_FieldNums;0)
	//ARRAY LONGINT(LL_al_FIeldNums2;0)
	//ARRAY LONGINT(LL_al_TableAccess;0)
	//ARRAY LONGINT(LL_al_TableIDs;0)
	//ARRAY POINTER(DB_aptr_Setup;0)
	//ARRAY TEXT(LAY_at_ColumnTitle;0)
	//ARRAY TEXT(LL_at_FieldName;0)
	//ARRAY TEXT(LL_at_FieldName2;0)
	//ARRAY TEXT(LL_at_FieldNames;0)
	//ARRAY TEXT(LL_at_TableNames;0)
	//ARRAY TEXT(LL_at_TableNames2;0)
	//ARRAY TEXT(SVS_at_PreviewDateString;0)
	C_BOOLEAN:C305(DB_bo_RecordModified; LAY_bo_AddRecord; LAY_bo_RecordEdited; Lay_bo_SetupEdited; LAY_bo_ShowLastColumn)
	C_LONGINT:C283($_l_ColumnIndex; $_l_ColumnNumber; $_l_ColumnsIndex2; $_l_FieldColumn; $_l_FontSize; $_l_LastColumn; $_l_LastNumber; $_l_Number; $_l_offset; $_l_RecordNumber; $_L_RecordNumberRow)
	C_LONGINT:C283($_l_TableNumberRow; LAY_l_ConfigCancel; LAY_l_ConfigSave; LAY_l_CurrentDefsTable)
	C_POINTER:C301($_ptr_Array; $_ptr_ArrayColors; $_ptr_ArrayColumnLock; $_ptr_ArrayEnterability; $_ptr_ArrayFieldPointers; $_ptr_ArrayFontSizes; $_ptr_ArrayFooters; $_ptr_ArrayFormatNames; $_ptr_ArrayFormulas; $_ptr_ArrayPointerArrayNames; $_ptr_ArrayPointers)
	C_POINTER:C301($_ptr_ArrayReferences; $_ptr_ArrayTitles; $_ptr_ArrayWIdths; $_Ptr_Field)
	C_TEXT:C284($_t_arrayConstruct; $_t_ColourName; $_t_ColumnTitle; $_t_LevelID; $_t_NumberDesignation; $_t_oldMethodName; AL_T_Formula; DB_t_CurrentDefinitions; LL_t_FieldName; LL_t_FieldName2; LL_t_TableName)
	C_TEXT:C284(LL_t_TableName2)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES]dAsk_StartImp.oAddUser2"; Form event code:C388)

If (LAY_bo_RecordEdited=True:C214)
	DB_bo_RecordModified:=True:C214
	//do we want to save the current loaded first
	Gen_Confirm("The current loaded column definition has been edited do you want to save it first?"; "Yes"; "No")
	If (OK=1)
		Lay_bo_SetupEdited:=True:C214
		DB_SaveRecord(->[LIST_LAYOUTS:96])
	End if 
	LAY_bo_RecordEdited:=False:C215
	$_t_ColumnTitle:=[LIST_LAYOUTS:96]Title:4
	$_l_ColumnNumber:=[LIST_LAYOUTS:96]Order:7
	$_l_RecordNumber:=Record number:C243([LIST_LAYOUTS:96])
	$_L_RecordNumberRow:=Find in array:C230(LAY_al_RecordNumbers; $_l_RecordNumber)
	If ($_L_RecordNumberRow<0)
		$_L_RecordNumberRow:=Find in array:C230(LAY_al_RecordNumbers; 0)
	End if 
	LAY_al_ColumnNumber{$_L_RecordNumberRow}:=$_l_ColumnNumber
	LAY_at_ColumnTitle{$_L_RecordNumberRow}:=$_t_ColumnTitle
	LAY_al_RecordNumbers{$_L_RecordNumberRow}:=$_l_RecordNumber
	SORT ARRAY:C229(LAY_al_ColumnNumber; LAY_at_ColumnTitle; LAY_al_RecordNumbers)
	$_l_LastNumber:=0
	For ($_l_ColumnIndex; 1; Size of array:C274(LAY_al_ColumnNumber))
		If (LAY_al_RecordNumbers{$_l_ColumnIndex}=0)
			LAY_al_RecordNumbers{$_l_ColumnIndex}:=1
		End if 
		If (LAY_al_ColumnNumber{$_l_ColumnIndex}=$_l_LastNumber)
			//its a clash
			If ($_l_RecordNumber#LAY_al_RecordNumbers{$_l_ColumnIndex})
				LAY_al_ColumnNumber{$_l_ColumnIndex}:=LAY_al_ColumnNumber{$_l_ColumnIndex}+1
				GOTO RECORD:C242([LIST_LAYOUTS:96]; LAY_al_RecordNumbers{$_l_ColumnIndex})
				[LIST_LAYOUTS:96]Order:7:=LAY_al_RecordNumbers{$_l_ColumnIndex}
				DB_SaveRecord(->[LIST_LAYOUTS:96])
			Else 
				$_l_offset:=0
				For ($_l_ColumnsIndex2; $_l_ColumnIndex; 1; -1)
					If (LAY_al_ColumnNumber{$_l_ColumnsIndex2}=LAY_al_ColumnNumber{$_l_ColumnIndex})
						LAY_al_ColumnNumber{$_l_ColumnsIndex2}:=LAY_al_ColumnNumber{$_l_ColumnIndex}+$_l_offset
						GOTO RECORD:C242([LIST_LAYOUTS:96]; LAY_al_RecordNumbers{$_l_ColumnIndex})
						[LIST_LAYOUTS:96]Order:7:=LAY_al_RecordNumbers{$_l_ColumnIndex}
						DB_SaveRecord(->[LIST_LAYOUTS:96])
					End if 
					$_l_offset:=$_l_offset+1
				End for 
			End if 
		End if 
		$_l_LastNumber:=LAY_al_ColumnNumber{$_l_ColumnIndex}
	End for 
	SORT ARRAY:C229(LAY_al_ColumnNumber; LAY_at_ColumnTitle; LAY_al_RecordNumbers)
	$_l_ColumnNumber:=0
	For ($_l_ColumnIndex; 1; Size of array:C274(LAY_al_ColumnNumber))
		$_l_ColumnNumber:=$_l_ColumnIndex
		If (LAY_al_ColumnNumber{$_l_ColumnIndex}#$_l_ColumnNumber)
			GOTO RECORD:C242([LIST_LAYOUTS:96]; LAY_al_RecordNumbers{$_l_ColumnIndex})
			LAY_al_ColumnNumber{$_l_ColumnIndex}:=$_l_ColumnNumber
			[LIST_LAYOUTS:96]Order:7:=$_l_ColumnNumber
			DB_SaveRecord(->[LIST_LAYOUTS:96])
			
		End if 
	End for 
	//``````
End if 
$_l_LastColumn:=LAY_al_ColumnNumber{Size of array:C274(LAY_al_ColumnNumber)}
LISTBOX INSERT ROWS:C913(LAY_lb_ColumnSettings; Size of array:C274(LAY_al_ColumnNumber)+1)
LAY_al_ColumnNumber{Size of array:C274(LAY_al_ColumnNumber)}:=$_l_LastColumn+1
LAY_at_ColumnTitle{Size of array:C274(LAY_at_ColumnTitle)}:="New Column"
CREATE RECORD:C68([LIST_LAYOUTS:96])
LAY_bo_RecordEdited:=False:C215
LAY_bo_AddRecord:=False:C215
[LIST_LAYOUTS:96]Order:7:=$_l_LastColumn+1
[LIST_LAYOUTS:96]Layout_Reference:1:=DB_t_CurrentDefinitions
[LIST_LAYOUTS:96]Table_Number:2:=LAY_l_CurrentDefsTable
[LIST_LAYOUTS:96]Field_Number:3:=1  //have to default it to something!
[LIST_LAYOUTS:96]Title:4:="New Column"
[LIST_LAYOUTS:96]Width:5:=100
[LIST_LAYOUTS:96]Enterable:8:=False:C215
[LIST_LAYOUTS:96]Font_Size:11:=9
[LIST_LAYOUTS:96]Footer:14:=0
[LIST_LAYOUTS:96]Formula:9:=""


If ([LIST_LAYOUTS:96]Table_Number:2#0)
	LL_LoadFieldNamePrefs([LIST_LAYOUTS:96]Table_Number:2)
	$_l_TableNumberRow:=Find in array:C230(LL_al_TableIDs; [LIST_LAYOUTS:96]Table_Number:2)
	ARRAY TEXT:C222(LL_at_TableNames2; 0)
	LL_t_TableName2:=""
	LL_t_FieldName2:=""
	For ($_l_ColumnIndex; 1; Size of array:C274(LL_al_TableIDs))
		If (User in group:C338(Current user:C182; "Designer"))
			APPEND TO ARRAY:C911(LL_at_TableNames2; LL_at_TableNames{$_l_ColumnIndex})
			
		Else 
			If (LL_al_TableAccess{$_l_ColumnIndex}>0)
				APPEND TO ARRAY:C911(LL_at_TableNames2; LL_at_TableNames{$_l_ColumnIndex})
				
			End if 
		End if 
	End for 
	LL_t_TableName:=LL_at_TableNames{$_l_TableNumberRow}
Else 
	$_l_TableNumberRow:=0
	LL_t_TableName:=""
End if 
If ($_l_TableNumberRow>0)
	ARRAY LONGINT:C221(LL_al_FieldNums; 0)
	ARRAY LONGINT:C221(LL_al_FIeldNums2; 0)
	ARRAY TEXT:C222(LL_at_FieldName; 0)
	ARRAY TEXT:C222(LL_at_FieldName2; 0)
	For ($_l_ColumnIndex; 1; Size of array:C274(LL_al_FieldNos{$_l_TableNumberRow}))
		If (User in group:C338(Current user:C182; "Designer"))
			APPEND TO ARRAY:C911(LL_at_FieldName; LL_at_FieldNames{$_l_TableNumberRow}{$_l_ColumnIndex})
			APPEND TO ARRAY:C911(LL_al_FieldNums; LL_al_FieldNos{$_l_TableNumberRow}{$_l_ColumnIndex})
			APPEND TO ARRAY:C911(LL_at_FieldName2; LL_at_FieldNames{$_l_TableNumberRow}{$_l_ColumnIndex})
			APPEND TO ARRAY:C911(LL_al_FieldNums2; LL_al_FieldNos{$_l_TableNumberRow}{$_l_ColumnIndex})
			
		Else 
			If (LL_al_FieldAccess{$_l_TableNumberRow}{$_l_ColumnIndex}>0)
				APPEND TO ARRAY:C911(LL_at_FieldName; LL_at_FieldNames{$_l_TableNumberRow}{$_l_ColumnIndex})
				APPEND TO ARRAY:C911(LL_al_FieldNums; LL_al_FieldNos{$_l_TableNumberRow}{$_l_ColumnIndex})
				APPEND TO ARRAY:C911(LL_at_FieldName2; LL_at_FieldNames{$_l_TableNumberRow}{$_l_ColumnIndex})
				APPEND TO ARRAY:C911(LL_al_FieldNums2; LL_al_FieldNos{$_l_TableNumberRow}{$_l_ColumnIndex})
				
			End if 
		End if 
		
	End for 
	$_l_FieldColumn:=Find in array:C230(LL_al_FieldNos{$_l_TableNumberRow}; [LIST_LAYOUTS:96]Field_Number:3)
	If ($_l_FieldColumn>0)
		LL_t_FieldName:=LL_at_FieldNames{$_l_TableNumberRow}{$_l_FieldColumn}
	Else 
		LL_t_FieldName:="???"
	End if 
End if 
If (([LIST_LAYOUTS:96]Footer:14=0) | ([LIST_LAYOUTS:96]Footer:14>6))
	[LIST_LAYOUTS:96]Footer:14:=1
End if 
OBJECT SET ENTERABLE:C238(LL_t_TableName; False:C215)
OBJECT SET VISIBLE:C603(LL_at_TableNames; True:C214)
OBJECT SET ENTERABLE:C238(LL_t_FieldName; False:C215)
OBJECT SET VISIBLE:C603(LL_at_FieldName; True:C214)
OBJECT SET ENTERABLE:C238([LIST_LAYOUTS:96]Enterable:8; True:C214)
OBJECT SET ENTERABLE:C238([LIST_LAYOUTS:96]Title:4; True:C214)
OBJECT SET ENTERABLE:C238([LIST_LAYOUTS:96]Format:6; True:C214)
OBJECT SET VISIBLE:C603(SVS_at_PreviewDateString; True:C214)
OBJECT SET ENTERABLE:C238(AL_T_Formula; True:C214)
OBJECT SET VISIBLE:C603(LAY_l_ConfigSave; True:C214)
OBJECT SET VISIBLE:C603(LAY_l_ConfigCancel; True:C214)
LAY_bo_RecordEdited:=True:C214
//`and add the column to the definitions
If (Size of array:C274(DB_aptr_Setup)>=20)
	$_ptr_ArrayFieldPointers:=DB_aptr_Setup{2}
	$_ptr_ArrayPointers:=DB_aptr_Setup{3}
	$_ptr_ArrayPointerArrayNames:=DB_aptr_Setup{4}
	$_ptr_ArrayFormatNames:=DB_aptr_Setup{5}
	$_ptr_ArrayFormulas:=DB_aptr_Setup{6}
	$_ptr_ArrayTitles:=DB_aptr_Setup{12}
	$_ptr_ArrayWIdths:=DB_aptr_Setup{13}
	$_ptr_ArrayEnterability:=DB_aptr_Setup{14}
	$_ptr_ArrayColumnLock:=DB_aptr_Setup{15}
	$_ptr_ArrayFontSizes:=DB_aptr_Setup{16}
	$_ptr_ArrayColors:=DB_aptr_Setup{17}
	$_ptr_ArrayFooters:=DB_aptr_Setup{18}
	$_ptr_ArrayReferences:=DB_aptr_Setup{9}
	$_t_LevelID:=$_ptr_ArrayReferences->{1}
	$_Ptr_Field:=Field:C253([LIST_LAYOUTS:96]Table_Number:2; [LIST_LAYOUTS:96]Field_Number:3)
	
	APPEND TO ARRAY:C911($_ptr_ArrayFieldPointers->; Field:C253([LIST_LAYOUTS:96]Table_Number:2; [LIST_LAYOUTS:96]Field_Number:3))
	Case of 
		: (Type:C295($_Ptr_Field->)=Is longint:K8:6)
			$_t_arrayConstruct:="LB_al"
			
		: (Type:C295($_Ptr_Field->)=Is integer:K8:5)
			$_t_arrayConstruct:="LB_ai"
		: (Type:C295($_Ptr_Field->)=Is real:K8:4)
			$_t_arrayConstruct:="LB_ar"
		: (Type:C295($_Ptr_Field->)=Is alpha field:K8:1)
			$_t_arrayConstruct:="LB_at"
		: (Type:C295($_Ptr_Field->)=Is text:K8:3)
			$_t_arrayConstruct:="LB_at"
		: (Type:C295($_Ptr_Field->)=Is boolean:K8:9)
			$_t_arrayConstruct:="LB_aBo"
		: (Type:C295($_Ptr_Field->)=Is time:K8:8)
			$_t_arrayConstruct:="LB_aTI"
		: (Type:C295($_Ptr_Field->)=Is date:K8:7)
			$_t_arrayConstruct:="LB_aD"
		: (Type:C295($_Ptr_Field->)=Is picture:K8:10)
			$_t_arrayConstruct:="LB_aPic"
		Else 
			$_t_arrayConstruct:="LB_at"
			//unknown type!
	End case 
	For ($_l_ColumnIndex; Size of array:C274($_ptr_ArrayPointerArrayNames->); 1; -1)  //this gets the highest used already array number
		$_t_NumberDesignation:=$_ptr_ArrayPointerArrayNames->{$_l_ColumnIndex}
		If (Position:C15($_t_arrayConstruct; $_t_NumberDesignation)>0)
			$_t_NumberDesignation:=Replace string:C233($_t_NumberDesignation; $_t_arrayConstruct+"_"+$_t_LevelID+"_"; "")
			$_l_ColumnIndex:=0
		End if 
	End for 
	$_l_Number:=Num:C11($_t_NumberDesignation)
	$_t_NumberDesignation:=$_t_arrayConstruct+"_"+$_t_LevelID+"_"+String:C10($_l_Number+1)
	$_ptr_Array:=Get pointer:C304($_t_NumberDesignation)
	APPEND TO ARRAY:C911($_ptr_ArrayPointers->; $_ptr_Array)
	APPEND TO ARRAY:C911($_ptr_ArrayPointerArrayNames->; $_t_NumberDesignation)
	APPEND TO ARRAY:C911($_ptr_ArrayFormatNames->; [LIST_LAYOUTS:96]Format:6)
	APPEND TO ARRAY:C911($_ptr_ArrayFormulas->; [LIST_LAYOUTS:96]Formula:9)
	APPEND TO ARRAY:C911($_ptr_ArrayTitles->; [LIST_LAYOUTS:96]Title:4)
	APPEND TO ARRAY:C911($_ptr_ArrayWIdths->; [LIST_LAYOUTS:96]Width:5)
	APPEND TO ARRAY:C911($_ptr_ArrayEnterability->; [LIST_LAYOUTS:96]Enterable:8)
	APPEND TO ARRAY:C911($_ptr_ArrayColumnLock->; False:C215)
	$_l_FontSize:=9
	$_t_ColourName:=""
	$_l_FontSize:=$_ptr_ArrayFontSizes->{1}
	$_t_ColourName:=$_ptr_ArrayColors->{1}
	APPEND TO ARRAY:C911($_ptr_ArrayFontSizes->; $_l_FontSize)
	APPEND TO ARRAY:C911($_ptr_ArrayColors->; $_t_ColourName)
	APPEND TO ARRAY:C911($_ptr_ArrayFooters->; [LIST_LAYOUTS:96]Footer:14)
	LAY_bo_ShowLastColumn:=True:C214
	LBi_LoadSetup(->DB_aptr_Setup)
	LBI_Scrollonresize(->LAY_lb_Columns)
	
	
Else 
	Gen_Alert("error")
	
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dAsk_StartImp.oAddUser2"; $_t_oldMethodName)
