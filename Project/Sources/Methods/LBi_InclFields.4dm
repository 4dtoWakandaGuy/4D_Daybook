//%attributes = {}
If (False:C215)
	//Project Method Name:      LBi_InclFields
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/01/2015 18:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By 
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(LBI_abo_DefaultEnterable;0;0)
	//ARRAY BOOLEAN(LBI_abo_DefaultLock;0;0)
	//ARRAY BOOLEAN(LBI_abo_DefaultRollover;0;0)
	ARRAY LONGINT:C221($_al_FieldNumber; 0)
	ARRAY LONGINT:C221($_al_RelatedField; 0)
	ARRAY LONGINT:C221($_al_RelatedTable; 0)
	ARRAY LONGINT:C221($_al_SortOrder; 0)
	ARRAY LONGINT:C221($_al_TableNumber; 0)
	//ARRAY LONGINT(LB_al_defaultFontSize;0;0)
	//ARRAY LONGINT(LBI_al_DefaultFieldNum;0;0)
	//ARRAY LONGINT(LBI_al_DefaultFontStyle;0;0)
	//ARRAY LONGINT(LBI_al_DefaultFooter;0;0)
	//ARRAY LONGINT(LBI_al_DefaultRelatedField;0;0)
	//ARRAY LONGINT(LBI_al_DefaultRelatedTable;0;0)
	//ARRAY LONGINT(LBI_al_DefaultRowTableNum;0;0)
	//ARRAY LONGINT(LBI_al_DefaultSortOrder;0;0)
	//ARRAY LONGINT(LBI_al_DefaultTableNum;0)
	//ARRAY LONGINT(LBI_al_DefaultWIdth;0;0)
	ARRAY TEXT:C222($_at_AssociatedArrayName; 0)
	ARRAY TEXT:C222($_at_FontNames; 0)
	ARRAY TEXT:C222($_at_FontStyles; 0)
	//ARRAY TEXT(LBI_at_DefaultColor;0;0)
	//ARRAY TEXT(LBI_at_DefaultFontName;0;0)
	//ARRAY TEXT(LBI_at_DefaultFormat;0;0)
	//ARRAY TEXT(LBI_at_DefaultFormula;0;0)
	//ARRAY TEXT(LBI_at_DefaultRelatedArray;0;0)
	//ARRAY TEXT(LBI_at_DefaultTitle;0;0)
	C_BOOLEAN:C305($_bo_append; $_bo_FieldIndexed; $_bo_FieldInvisible; $_bo_FieldUnique; $_bo_isaField; $_bo_Reload; $_bo_Search; $_bo_TypeIsSet; $2; $3; AL_bo_AutoCreate)
	C_BOOLEAN:C305(LAY_bo_OverrideDefaults; LBI_bo_DefaultsInited)
	C_LONGINT:C283($_l_AreaType; $_l_ArrayPosition2; $_l_ArraysCount; $_l_ArraySIze; $_l_ArraySIze2; $_l_CountFields; $_l_Difference; $_l_FIeldIndex; $_l_FIeldLength; $_l_FieldNumber; $_l_FIeldType)
	C_LONGINT:C283($_l_KeyFieldNumber; $_l_NextBooleanArray; $_l_NextDateArray; $_l_NextIntegerArray; $_l_NextLongintArray; $_l_NextPictureArray; $_l_NextRealArray; $_l_NextTextArray; $_l_NextTImeArray; $_l_ProcessNumber; $_l_ProcessState)
	C_LONGINT:C283($_l_ReturnArrayType; $_l_ScriptPosition; $_l_SortOrder; $_l_TableNumber; $_l_TotalColumnCount)
	C_POINTER:C301($_ptr_areaTypeVariable; $_ptr_ArrayArrayNames; $_ptr_ArrayArrayPointers; $_ptr_ArrayColors; $_ptr_ArrayColumnLock; $_ptr_ArrayEnterability; $_ptr_ArrayFieldPointers; $_ptr_ArrayFontName; $_ptr_ArrayFontSize; $_ptr_ArrayFontStyle; $_ptr_ArrayFooters)
	C_POINTER:C301($_ptr_ArrayFormatNames; $_ptr_ArrayFormulas; $_ptr_ArrayReferences; $_ptr_ArrayRollovers; $_ptr_ArrayTitles; $_ptr_ArrayWidths; $_ptr_FIeldPointer; $1; vPtr)
	C_REAL:C285(VTextNUM)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; <>SYS_t_DefaultFontPlain; $_t_CurrentDefinitionsName; $_t_DeleteTitle; $_t_DummyLayoutReference; $_t_DummyLayoutReference2; $_t_FIeldName; $_t_LevelID; $_t_oldMethodName; $_t_OldMethodName2; $_t_ProcessName)
	C_TEXT:C284($_T_Script; $_t_TableNumberString; $_t_VariableName; DB_t_Methodname; LAY_T_LoadUserPrefs; vT; Vtext; VText_2)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("LBi_InclFields")

//NG 21/7/2006 This method is a direct replacement for ALinclFields
DB_t_Methodname:=Current method name:C684
//AL Incl Fields  - the Prefix pointers method Selected Record numbers
//see also ALInclFieldArr & ALStartBack2
//$1 = Ptr to Array of Pointers
//$2 = if false will not search for List Layouts
//TRACE

If (Count parameters:C259>=3)
	$_bo_Reload:=$3
Else 
	$_bo_Reload:=False:C215
End if 

$_l_ReturnArrayType:=0
If (Count parameters:C259>=1)
	If (GenValidatePointer($1))
		If (Count parameters:C259>=2)
			$_bo_Search:=$2
		Else 
			$_bo_Search:=True:C214
		End if 
		If (Size of array:C274($1->)>=18)
			$_ptr_ArrayFieldPointers:=$1->{2}
			$_ptr_ArrayArrayPointers:=$1->{3}
			$_ptr_ArrayArrayNames:=$1->{4}
			$_ptr_ArrayFormatNames:=$1->{5}
			$_ptr_ArrayFormulas:=$1->{6}
			
			//Dont want to mess with the pointers array!!!
			
			//$PFontNameArray:=Get pointer(
			//ARRAY TEXT(a01FontName;0)
			//ARRAY LONGINT(a01FontStyle;0)
			$_ptr_ArrayReferences:=$1->{9}
			$_ptr_ArrayTitles:=$1->{12}
			$_ptr_ArrayWidths:=$1->{13}
			$_ptr_ArrayEnterability:=$1->{14}
			$_ptr_ArrayColumnLock:=$1->{15}
			$_ptr_ArrayFontSize:=$1->{16}
			$_ptr_ArrayColors:=$1->{17}
			$_ptr_ArrayFooters:=$1->{18}
			$_ptr_ArrayRollovers:=$1->{21}
			$_t_LevelID:=$_ptr_ArrayReferences->{1}
			$_ptr_ArrayFontName:=Get pointer:C304("LB_at_"+$_t_LevelID+"FontName")
			$_ptr_ArrayFontStyle:=Get pointer:C304("LB_at_"+$_t_LevelID+"FontStyle")
			$_l_AreaType:=1
			$_ptr_areaTypeVariable:=->$_l_AreaType
			If (Size of array:C274($1->)>=19)
				$_ptr_areaTypeVariable:=$1->{19}
			End if 
			$_t_LevelID:=$_ptr_ArrayReferences->{1}
			While (Semaphore:C143("$Inserting"+"ALREFS"))
				DelayTicks
			End while 
			
			
			If (LAY_bo_OverrideDefaults)
				$_t_CurrentDefinitionsName:=$_ptr_ArrayReferences->{6}+LAY_T_LoadUserPrefs
				LAY_bo_OverrideDefaults:=False:C215  //make sure it gets reset!
			Else 
				$_t_CurrentDefinitionsName:=$_ptr_ArrayReferences->{6}+$_ptr_ArrayReferences->{7}
			End if 
			
			CLEAR SEMAPHORE:C144("$Inserting"+"ALREFS")
			$_l_TableNumber:=Table:C252(($1->{7}))
			If ($_l_TableNumber<10)
				$_t_TableNumberString:=("00"*Num:C11($_l_TableNumber<10))+String:C10($_l_TableNumber)
			Else 
				$_t_TableNumberString:=("0"*Num:C11($_l_TableNumber<100))+String:C10($_l_TableNumber)
			End if 
			
			$_t_DummyLayoutReference:=("0"*Num:C11(True:C214)+String:C10(0))
			$_t_DummyLayoutReference2:=String:C10(0)
			
			REDUCE SELECTION:C351([LIST_LAYOUTS:96]; 0)
			If ((($_t_CurrentDefinitionsName)#($_t_TableNumberString+$_t_DummyLayoutReference)) & (($_t_CurrentDefinitionsName)#($_t_TableNumberString+$_t_DummyLayoutReference2)) & ((($_t_CurrentDefinitionsName#($_t_TableNumberString+$_t_DummyLayoutReference+<>PER_t_CurrentUserInitials))) & (($_t_CurrentDefinitionsName)#($_t_TableNumberString+$_t_DummyLayoutReference2+<>PER_t_CurrentUserInitials))))
				
				
				
				
				
				
				If (($_bo_Search) | (Records in selection:C76([LIST_LAYOUTS:96])=0))
					QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$_t_CurrentDefinitionsName)  //Search first by Ref+User
				End if 
				If (Records in selection:C76([LIST_LAYOUTS:96])=0) | ([LIST_LAYOUTS:96]Layout_Reference:1#($_ptr_ArrayReferences->{6}+"@"))
					QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$_ptr_ArrayReferences->{6})  //Then just by ref
					If (Records in selection:C76([LIST_LAYOUTS:96])=0)
						AL_bo_AutoCreate:=True:C214  //NG may 2004---this can be done in a preference
						If (AL_bo_AutoCreate=False:C215)
							CONFIRM:C162("DEFINITIONS MAY BE MISSING   "; "IGNORE"; "CREATE")
						End if 
						If (OK=0) | (AL_bo_AutoCreate)
							$_t_CurrentDefinitionsName:=$_ptr_ArrayReferences->{6}
							While (Semaphore:C143("Creating"+$_t_CurrentDefinitionsName))
								DelayTicks(2)
							End while 
							QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$_ptr_ArrayReferences->{6})  //Then just by ref
							If (Records in selection:C76([LIST_LAYOUTS:96])=0)
								//This has to run in a seperate process..or the records don't really exist.
								$_l_ProcessNumber:=New process:C317("LBi_ListLay"; 128000; "CreateLayoutRecords"+$_t_CurrentDefinitionsName; $_ptr_ArrayReferences->{6})
								$_l_ProcessState:=Process state:C330($_l_ProcessNumber)
								While ($_l_ProcessState>=0)
									$_t_ProcessName:=Process_Name($_l_ProcessNumber)
									If (("CreateLayoutRecords"+$_t_CurrentDefinitionsName)=$_t_ProcessName)
										DelayTicks(2)
										$_l_ProcessState:=Process state:C330($_l_ProcessNumber)
									Else 
										$_l_ProcessState:=-1
									End if 
								End while 
								QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$_ptr_ArrayReferences->{6})
							End if 
							CLEAR SEMAPHORE:C144("Creating"+$_t_CurrentDefinitionsName)
						Else 
							REDUCE SELECTION:C351([LIST_LAYOUTS:96]; 0)
						End if 
						
					End if 
				End if 
				ARRAY LONGINT:C221($_al_TableNumber; 0)
				ARRAY LONGINT:C221($_al_FieldNumber; 0)
				ARRAY LONGINT:C221($_al_SortOrder; 0)
				ARRAY TEXT:C222($_at_FontNames; 0)
				ARRAY TEXT:C222($_at_FontStyles; 0)
				ARRAY LONGINT:C221($_al_RelatedTable; 0)
				ARRAY LONGINT:C221($_al_RelatedField; 0)
				SELECTION TO ARRAY:C260([LIST_LAYOUTS:96]Table_Number:2; $_al_TableNumber; [LIST_LAYOUTS:96]Field_Number:3; $_al_FieldNumber; [LIST_LAYOUTS:96]Format:6; $_ptr_ArrayFormatNames->; [LIST_LAYOUTS:96]Order:7; $_al_SortOrder; [LIST_LAYOUTS:96]Formula:9; $_ptr_ArrayFormulas->; [LIST_LAYOUTS:96]Title:4; $_ptr_ArrayTitles->; [LIST_LAYOUTS:96]Width:5; $_ptr_ArrayWidths->; [LIST_LAYOUTS:96]Enterable:8; $_ptr_ArrayEnterability->; [LIST_LAYOUTS:96]Locked:10; $_ptr_ArrayColumnLock->; [LIST_LAYOUTS:96]Font_Size:11; $_ptr_ArrayFontSize->; [LIST_LAYOUTS:96]Colour:12; $_ptr_ArrayColors->; [LIST_LAYOUTS:96]Footer:14; $_ptr_ArrayFooters->; [LIST_LAYOUTS:96]X_Related_Field:16; $_al_RelatedField; [LIST_LAYOUTS:96]X_Related_Table:15; $_al_RelatedField; [LIST_LAYOUTS:96]X_associatedArrayName:17; $_at_AssociatedArrayName)  //used for sub tables only
				SELECTION TO ARRAY:C260([LIST_LAYOUTS:96]X_Font_Name:18; $_ptr_ArrayFontName->; [LIST_LAYOUTS:96]X_Font_Style:19; $_ptr_ArrayFontStyle->; [LIST_LAYOUTS:96]X_Rollover:20; $_ptr_ArrayRollovers->)
			Else 
				If (Not:C34(LBI_bo_DefaultsInited))
					ARRAY LONGINT:C221(LBI_al_DefaultTableNum; 0)
					ARRAY LONGINT:C221(LBI_al_DefaultRowTableNum; 0; 0)
					ARRAY LONGINT:C221(LBI_al_DefaultFieldNum; 0; 0)
					ARRAY TEXT:C222(LBI_at_DefaultFormat; 0; 0)
					ARRAY LONGINT:C221(LBI_al_DefaultSortOrder; 0; 0)
					ARRAY TEXT:C222(LBI_at_DefaultFormula; 0; 0)
					ARRAY TEXT:C222(LBI_at_DefaultTitle; 0; 0)
					ARRAY LONGINT:C221(LBI_al_DefaultWIdth; 0; 0)
					ARRAY BOOLEAN:C223(LBI_abo_DefaultEnterable; 0; 0)
					ARRAY BOOLEAN:C223(LBI_abo_DefaultLock; 0; 0)
					ARRAY LONGINT:C221(LB_al_defaultFontSize; 0; 0)
					ARRAY TEXT:C222(LBI_at_DefaultColor; 0; 0)
					ARRAY LONGINT:C221(LBI_al_DefaultFooter; 0; 0)
					ARRAY LONGINT:C221(LBI_al_DefaultRelatedField; 0; 0)
					ARRAY LONGINT:C221(LBI_al_DefaultRelatedTable; 0; 0)
					ARRAY TEXT:C222(LBI_at_DefaultRelatedArray; 0; 0)
					ARRAY TEXT:C222(LBI_at_DefaultFontName; 0; 0)
					ARRAY LONGINT:C221(LBI_al_DefaultFontStyle; 0; 0)
					ARRAY BOOLEAN:C223(LBI_abo_DefaultRollover; 0; 0)
					LBI_bo_DefaultsInited:=True:C214
				End if 
				$_l_ArrayPosition2:=Find in array:C230(LBI_al_DefaultTableNum; $_l_TableNumber)
				If ($_l_ArrayPosition2<0)
					APPEND TO ARRAY:C911(LBI_al_DefaultTableNum; $_l_TableNumber)
					INSERT IN ARRAY:C227(LBI_al_DefaultRowTableNum; Size of array:C274(LBI_al_DefaultRowTableNum)+1; 1)
					INSERT IN ARRAY:C227(LBI_al_DefaultFieldNum; Size of array:C274(LBI_al_DefaultRowTableNum)+1; 1)
					INSERT IN ARRAY:C227(LBI_at_DefaultFormat; Size of array:C274(LBI_al_DefaultRowTableNum)+1; 1)
					INSERT IN ARRAY:C227(LBI_al_DefaultSortOrder; Size of array:C274(LBI_al_DefaultRowTableNum)+1; 1)
					INSERT IN ARRAY:C227(LBI_at_DefaultFormula; Size of array:C274(LBI_al_DefaultRowTableNum)+1; 1)
					INSERT IN ARRAY:C227(LBI_at_DefaultTitle; Size of array:C274(LBI_al_DefaultRowTableNum)+1; 1)
					INSERT IN ARRAY:C227(LBI_al_DefaultWIdth; Size of array:C274(LBI_al_DefaultRowTableNum)+1; 1)
					INSERT IN ARRAY:C227(LBI_abo_DefaultEnterable; Size of array:C274(LBI_al_DefaultRowTableNum)+1; 1)
					INSERT IN ARRAY:C227(LBI_abo_DefaultLock; Size of array:C274(LBI_al_DefaultRowTableNum)+1; 1)
					INSERT IN ARRAY:C227(LB_al_defaultFontSize; Size of array:C274(LBI_al_DefaultRowTableNum)+1; 1)
					INSERT IN ARRAY:C227(LBI_at_DefaultColor; Size of array:C274(LBI_al_DefaultRowTableNum)+1; 1)
					INSERT IN ARRAY:C227(LBI_al_DefaultFooter; Size of array:C274(LBI_al_DefaultRowTableNum)+1; 1)
					INSERT IN ARRAY:C227(LBI_al_DefaultRelatedField; Size of array:C274(LBI_al_DefaultRowTableNum)+1; 1)
					INSERT IN ARRAY:C227(LBI_al_DefaultRelatedTable; Size of array:C274(LBI_al_DefaultRowTableNum)+1; 1)
					INSERT IN ARRAY:C227(LBI_at_DefaultRelatedArray; Size of array:C274(LBI_al_DefaultRowTableNum)+1; 1)
					INSERT IN ARRAY:C227(LBI_at_DefaultFontName; Size of array:C274(LBI_al_DefaultRowTableNum)+1; 1)
					INSERT IN ARRAY:C227(LBI_al_DefaultFontStyle; Size of array:C274(LBI_al_DefaultRowTableNum)+1; 1)
					INSERT IN ARRAY:C227(LBI_abo_DefaultRollover; Size of array:C274(LBI_al_DefaultRowTableNum)+1; 1)
					$_l_ArrayPosition2:=Size of array:C274(LBI_abo_DefaultRollover)
					
					
				End if 
				$_l_CountFields:=Get last field number:C255($_l_TableNumber)
				$_l_SortOrder:=1
				For ($_l_FIeldIndex; 1; $_l_CountFields)
					If (Is field number valid:C1000($_l_TableNumber; $_l_FIeldIndex))
						$_ptr_FIeldPointer:=Field:C253($_l_TableNumber; $_l_FIeldIndex)
						$_t_FIeldName:=Field name:C257($_ptr_FIeldPointer)
						GET FIELD PROPERTIES:C258($_l_TableNumber; $_l_FIeldIndex; $_l_FIeldType; $_l_FIeldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
						$_bo_append:=False:C215
						If (User in group:C338(Current user:C182; "Designer"))
							
							$_bo_append:=True:C214
						Else 
							If (($_t_FIeldName#"X@") & (Not:C34($_bo_FieldInvisible)))
								$_bo_append:=False:C215
							End if 
							
						End if 
						If (Type:C295($_ptr_FIeldPointer->)=30)
							$_bo_append:=False:C215
						End if 
						If ($_bo_append)
							APPEND TO ARRAY:C911(LBI_al_DefaultRowTableNum{$_l_ArrayPosition2}; $_l_TableNumber)
							APPEND TO ARRAY:C911(LBI_al_DefaultFieldNum{$_l_ArrayPosition2}; $_l_FIeldIndex)
							APPEND TO ARRAY:C911(LBI_at_DefaultFormat{$_l_ArrayPosition2}; "")
							APPEND TO ARRAY:C911(LBI_al_DefaultSortOrder{$_l_ArrayPosition2}; $_l_SortOrder)
							$_l_SortOrder:=$_l_SortOrder+1
							APPEND TO ARRAY:C911(LBI_at_DefaultFormula{$_l_ArrayPosition2}; "")
							APPEND TO ARRAY:C911(LBI_at_DefaultTitle{$_l_ArrayPosition2}; Field name:C257($_ptr_FIeldPointer))
							Case of 
								: ((Type:C295($_ptr_FIeldPointer->))=Is text:K8:3)
									APPEND TO ARRAY:C911(LBI_al_DefaultWIdth{$_l_ArrayPosition2}; 150)
									APPEND TO ARRAY:C911(LBI_abo_DefaultEnterable{$_l_ArrayPosition2}; True:C214)
								: ((Type:C295($_ptr_FIeldPointer->))=Is alpha field:K8:1)
									APPEND TO ARRAY:C911(LBI_al_DefaultWIdth{$_l_ArrayPosition2}; 75)
									APPEND TO ARRAY:C911(LBI_abo_DefaultEnterable{$_l_ArrayPosition2}; True:C214)
								: ((Type:C295($_ptr_FIeldPointer->))=Is longint:K8:6)
									APPEND TO ARRAY:C911(LBI_al_DefaultWIdth{$_l_ArrayPosition2}; 50)
									APPEND TO ARRAY:C911(LBI_abo_DefaultEnterable{$_l_ArrayPosition2}; True:C214)
								: ((Type:C295($_ptr_FIeldPointer->))=Is real:K8:4)
									APPEND TO ARRAY:C911(LBI_al_DefaultWIdth{$_l_ArrayPosition2}; 50)
									APPEND TO ARRAY:C911(LBI_abo_DefaultEnterable{$_l_ArrayPosition2}; True:C214)
								: ((Type:C295($_ptr_FIeldPointer->))=Is integer:K8:5)
									APPEND TO ARRAY:C911(LBI_al_DefaultWIdth{$_l_ArrayPosition2}; 50)
									APPEND TO ARRAY:C911(LBI_abo_DefaultEnterable{$_l_ArrayPosition2}; True:C214)
								: ((Type:C295($_ptr_FIeldPointer->))=Is boolean:K8:9)
									APPEND TO ARRAY:C911(LBI_al_DefaultWIdth{$_l_ArrayPosition2}; 25)
									APPEND TO ARRAY:C911(LBI_abo_DefaultEnterable{$_l_ArrayPosition2}; True:C214)
								: ((Type:C295($_ptr_FIeldPointer->))=Is date:K8:7)
									APPEND TO ARRAY:C911(LBI_al_DefaultWIdth{$_l_ArrayPosition2}; 40)
									APPEND TO ARRAY:C911(LBI_abo_DefaultEnterable{$_l_ArrayPosition2}; True:C214)
								: ((Type:C295($_ptr_FIeldPointer->))=Is time:K8:8)
									APPEND TO ARRAY:C911(LBI_al_DefaultWIdth{$_l_ArrayPosition2}; 40)
									APPEND TO ARRAY:C911(LBI_abo_DefaultEnterable{$_l_ArrayPosition2}; True:C214)
								: ((Type:C295($_ptr_FIeldPointer->))=Is BLOB:K8:12)
									APPEND TO ARRAY:C911(LBI_al_DefaultWIdth{$_l_ArrayPosition2}; 150)
									APPEND TO ARRAY:C911(LBI_abo_DefaultEnterable{$_l_ArrayPosition2}; False:C215)
								: ((Type:C295($_ptr_FIeldPointer->))=Is picture:K8:10)
									APPEND TO ARRAY:C911(LBI_al_DefaultWIdth{$_l_ArrayPosition2}; 150)
									APPEND TO ARRAY:C911(LBI_abo_DefaultEnterable{$_l_ArrayPosition2}; False:C215)
								Else 
									APPEND TO ARRAY:C911(LBI_al_DefaultWIdth{$_l_ArrayPosition2}; 50)
									APPEND TO ARRAY:C911(LBI_abo_DefaultEnterable{$_l_ArrayPosition2}; False:C215)
							End case 
							APPEND TO ARRAY:C911(LBI_abo_DefaultLock{$_l_ArrayPosition2}; False:C215)
							APPEND TO ARRAY:C911(LB_al_defaultFontSize{$_l_ArrayPosition2}; 12)
							APPEND TO ARRAY:C911(LBI_at_DefaultColor{$_l_ArrayPosition2}; "Black")
							APPEND TO ARRAY:C911(LBI_al_DefaultFooter{$_l_ArrayPosition2}; 0)
							APPEND TO ARRAY:C911(LBI_al_DefaultRelatedField{$_l_ArrayPosition2}; 0)
							APPEND TO ARRAY:C911(LBI_al_DefaultRelatedTable{$_l_ArrayPosition2}; 0)
							APPEND TO ARRAY:C911(LBI_at_DefaultRelatedArray{$_l_ArrayPosition2}; "")
							APPEND TO ARRAY:C911(LBI_at_DefaultFontName{$_l_ArrayPosition2}; <>SYS_t_DefaultFontPlain)
							APPEND TO ARRAY:C911(LBI_al_DefaultFontStyle{$_l_ArrayPosition2}; Plain:K14:1)
							APPEND TO ARRAY:C911(LBI_abo_DefaultRollover{$_l_ArrayPosition2}; False:C215)
							
						End if 
						
					End if 
				End for 
				ARRAY LONGINT:C221($_al_TableNumber; 0)
				ARRAY LONGINT:C221($_al_FieldNumber; 0)
				ARRAY LONGINT:C221($_al_SortOrder; 0)
				ARRAY TEXT:C222($_at_FontNames; 0)
				ARRAY TEXT:C222($_at_FontStyles; 0)
				ARRAY LONGINT:C221($_al_RelatedTable; 0)
				ARRAY LONGINT:C221($_al_RelatedField; 0)
				
				//COpy array(LBI_al_DefaultTableNum{$_l_ArrayPosition2};$_al_TableNumber)
				COPY ARRAY:C226(LBI_al_DefaultRowTableNum{$_l_ArrayPosition2}; $_al_TableNumber)
				COPY ARRAY:C226(LBI_al_DefaultFieldNum{$_l_ArrayPosition2}; $_al_FieldNumber)
				COPY ARRAY:C226(LBI_at_DefaultFormat{$_l_ArrayPosition2}; $_ptr_ArrayFormatNames->)
				COPY ARRAY:C226(LBI_al_DefaultSortOrder{$_l_ArrayPosition2}; $_al_SortOrder)
				COPY ARRAY:C226(LBI_at_DefaultFormula{$_l_ArrayPosition2}; $_ptr_ArrayFormulas->)
				COPY ARRAY:C226(LBI_at_DefaultTitle{$_l_ArrayPosition2}; $_ptr_ArrayTitles->)
				COPY ARRAY:C226(LBI_al_DefaultWIdth{$_l_ArrayPosition2}; $_ptr_ArrayWidths->)
				COPY ARRAY:C226(LBI_abo_DefaultEnterable{$_l_ArrayPosition2}; $_ptr_ArrayEnterability->)
				COPY ARRAY:C226(LBI_abo_DefaultLock{$_l_ArrayPosition2}; $_ptr_ArrayColumnLock->)
				COPY ARRAY:C226(LB_al_defaultFontSize{$_l_ArrayPosition2}; $_ptr_ArrayFontSize->)
				COPY ARRAY:C226(LBI_at_DefaultColor{$_l_ArrayPosition2}; $_ptr_ArrayColors->)
				COPY ARRAY:C226(LBI_al_DefaultFooter{$_l_ArrayPosition2}; $_ptr_ArrayFooters->)
				COPY ARRAY:C226(LBI_al_DefaultRelatedField{$_l_ArrayPosition2}; $_al_RelatedField)
				COPY ARRAY:C226(LBI_al_DefaultRelatedTable{$_l_ArrayPosition2}; $_al_RelatedTable)
				COPY ARRAY:C226(LBI_at_DefaultRelatedArray{$_l_ArrayPosition2}; $_at_AssociatedArrayName)
				COPY ARRAY:C226(LBI_at_DefaultFontName{$_l_ArrayPosition2}; $_ptr_ArrayFontName->)
				COPY ARRAY:C226(LBI_al_DefaultFontStyle{$_l_ArrayPosition2}; $_ptr_ArrayFontStyle->)
				COPY ARRAY:C226(LBI_abo_DefaultRollover{$_l_ArrayPosition2}; $_ptr_ArrayRollovers->)
				
				
			End if 
			
			SORT ARRAY:C229($_al_SortOrder; $_al_TableNumber; $_al_FieldNumber; $_ptr_ArrayFormatNames->; $_ptr_ArrayFormulas->; $_ptr_ArrayTitles->; $_ptr_ArrayWidths->; $_ptr_ArrayEnterability->; $_ptr_ArrayColumnLock->; $_ptr_ArrayFontSize->; $_ptr_ArrayColors->; $_ptr_ArrayFooters->; $_ptr_ArrayFontName->; $_ptr_ArrayFontStyle->; $_al_RelatedTable; $_al_RelatedField; $_at_AssociatedArrayName; $_ptr_ArrayRollovers->; >)
			$_l_ArraySIze:=Size of array:C274($_al_TableNumber)
			
			
			While (Semaphore:C143("$Inserting"+"ALREFS"))
				DelayTicks
			End while 
			If ($_bo_Reload)
				$_l_ArraySIze2:=Size of array:C274($_ptr_ArrayFieldPointers->)
				Case of 
					: ($_l_ArraySIze2<$_l_ArraySIze)
						//Add elements in
						$_l_Difference:=$_l_ArraySIze-$_l_ArraySIze2
						INSERT IN ARRAY:C227($_ptr_ArrayFieldPointers->; 1; $_l_Difference)
						INSERT IN ARRAY:C227($_ptr_ArrayArrayPointers->; 1; $_l_Difference)
						INSERT IN ARRAY:C227($_ptr_ArrayArrayNames->; 1; $_l_Difference)
						//```
						//INSERT IN ARRAY($_ptr_ArrayFormatNames->;$_l_ColumnNumber;1)
						//INSERT IN ARRAY($PFormulaArrayPtr->;$_l_ColumnNumber;1)
						//INSERT IN ARRAY($_ptr_ArrayTitles->;$_l_ColumnNumber;1)
						//INSERT IN ARRAY($_ptr_ArrayWidths->;$_l_ColumnNumber;1)
						//INSERT IN ARRAY($_ptr_ArrayColumnLock->;$_l_ColumnNumber;1)
						//INSERT IN ARRAY($_ptr_ArrayFontSize->;$_l_ColumnNumber;1)
						//INSERT IN ARRAY($_ptr_ArrayColors->;$_l_ColumnNumber;1)
						//INSERT IN ARRAY($_ptr_ArrayFooters->;$_l_ColumnNumber;1)
						//INSERT IN ARRAY($_ptr_ArrayEnterability->;$_l_ColumnNumber;1)
						//``
					: ($_l_ArraySIze2>$_l_ArraySIze)
						//delete some
						$_l_Difference:=$_l_ArraySIze2-$_l_ArraySIze
						DELETE FROM ARRAY:C228($_ptr_ArrayFieldPointers->; $_l_ArraySIze2-$_l_Difference; $_l_Difference)
						
						DELETE FROM ARRAY:C228($_ptr_ArrayArrayPointers->; $_l_ArraySIze2-$_l_Difference; $_l_Difference)
						DELETE FROM ARRAY:C228($_ptr_ArrayArrayNames->; $_l_ArraySIze2-$_l_Difference; $_l_Difference)
						
				End case 
				
			Else 
				INSERT IN ARRAY:C227($_ptr_ArrayFieldPointers->; 1; $_l_ArraySIze)
				
				INSERT IN ARRAY:C227($_ptr_ArrayArrayPointers->; 1; $_l_ArraySIze)
				INSERT IN ARRAY:C227($_ptr_ArrayArrayNames->; 1; $_l_ArraySIze)
			End if 
			CLEAR SEMAPHORE:C144("$Inserting"+"ALREFS")
			$_l_NextTextArray:=0  //String
			$_l_NextTextArray:=0  // text
			$_l_NextRealArray:=0  //Real
			$_l_NextDateArray:=0  //Date
			$_l_NextPictureArray:=0
			$_l_NextBooleanArray:=0  //Boolean
			$_l_NextIntegerArray:=0  //Integer
			$_l_NextLongintArray:=0  //Longint
			$_l_TotalColumnCount:=1  //Total count
			$_l_NextTimeArray:=0
			$_l_KeyFieldNumber:=0
			$_l_FIeldIndex:=1
			$_t_DeleteTitle:=""
			$_l_ArraysCount:=0
			//load in the array names and ptrs to be used for each column
			//while checking that the maximums for each type haven't been exceeded
			While ($_l_FIeldIndex<=$_l_ArraySIze)  //NB: has to be While cos $_l_ArraySIze changes
				//IDLE  ` 03/04/03 pb
				$_bo_TypeIsSet:=False:C215
				
				
				$_l_TotalColumnCount:=$_l_TotalColumnCount+1
				If ($_al_TableNumber{$_l_FIeldIndex}#0)
					If ($_ptr_ArrayReferences->{8}="")  //if is a main file
						$_ptr_ArrayFieldPointers->{$_l_FIeldIndex}:=Field:C253($_al_TableNumber{$_l_FIeldIndex}; $_al_FieldNumber{$_l_FIeldIndex})
						//this does not handle the scenario where a MAIN file field is to be displayed in a subtable area
					Else 
						//This section of code should not be getting used as we no longer have subtables
						If ($_al_TableNumber{$_l_FIeldIndex}=Table:C252($1->{10}))  //if the field isn't from another file
							$_l_FieldType:=Type:C295(Field:C253($_al_TableNumber{$_l_FIeldIndex}; $_al_FieldNumber{$_l_FIeldIndex})->)
							
							If ($_ptr_ArrayFormulas->{$_l_FIeldIndex}="")  // it is not a formula
								$_ptr_ArrayFieldPointers->{$_l_FIeldIndex}:=Field:C253($_al_TableNumber{$_l_FIeldIndex}; $_al_FieldNumber{$_l_FIeldIndex})
							Else 
								$_T_Script:=$_ptr_ArrayFormulas->{$_l_FIeldIndex}
								$_T_Script:=Macro_translate($_T_Script)
								If ($_T_Script#"")
									$_bo_isaField:=Not:C34($_T_Script[[1]]="•")  //if the formula begins with a bullet the fomrula is a field in another table..
									//in a table based area the column will be set by formula
									If ($_bo_isaField)  //this is NEVER going to happen now
										//ng-have to get the field type to set the column formula for a tab
										$_t_OldMethodName2:=ERR_MethodTracker("EXECUTE: "+"vPtr:=->"+$_ptr_ArrayReferences->{8}+"'"+$_ptr_ArrayFormulas->{$_l_FIeldIndex})
										EXECUTE FORMULA:C63("vPtr:=->"+$_ptr_ArrayReferences->{8}+"'"+$_ptr_ArrayFormulas->{$_l_FIeldIndex})  //ptr to the subfield
										$_ptr_ArrayFieldPointers->{$_l_FIeldIndex}:=vPtr
										//$Arraygroup:=$_ptr_ArrayReferences->{2}
									Else 
										
										If ($_al_RelatedTable{$_l_FIeldIndex}>0) & ($_al_RelatedField{$_l_FIeldIndex}>0)
											
											//in a table based area the automatic relations are off so the formula will be set to
											//"DB_GetRelated("+$_ptr_ArrayReferences->{8};$_al_RelatedField{$_l_FIeldIndex};$_al_RelatedField{$_l_FIeldIndex})""
											$_T_Script:=Substring:C12($_T_Script; 2; Length:C16($_T_Script))
											EXECUTE FORMULA:C63($_T_Script)
											
											$_ptr_ArrayFieldPointers->{$_l_FIeldIndex}:=Field:C253($_al_RelatedTable{$_l_FIeldIndex}; $_al_RelatedField{$_l_FIeldIndex})  //we will still set this in the table based because we want the field type to set the column data type..this column is NEVER enterable
											If ($_ptr_areaTypeVariable->=3)
												$_ptr_ArrayFormulas->{$_l_FIeldIndex}:="DB_GetRelated("+$_ptr_ArrayReferences->{8}+";"+$_al_RelatedTable{$_l_FIeldIndex}+";"+$_al_RelatedField{$_l_FIeldIndex}+")"
											End if 
										Else 
											$_T_Script:=Substring:C12($_T_Script; 2; Length:C16($_T_Script))
											$_l_ScriptPosition:=Position:C15("Macro_ResultTxt"; $_T_Script)
											If ($_l_ScriptPosition>0)
												//TRACE
												//In this case in a table based are the TYPE of the column is always TEXT
												//the formula for the column is
												EXECUTE FORMULA:C63("VText:="+$_T_Script)
												Vptr:=->Vtext
												//set the field point to any text field if this is a table based area-dont worry about which table
												//$_ptr_ArrayFieldPointers->{$_l_FIeldIndex}:=Vptr
												$_bo_TypeIsSet:=True:C214
												$_l_FieldType:=Is text:K8:3
												If ($_ptr_areaTypeVariable->=3)
													$_ptr_ArrayFieldPointers->{$_l_FIeldIndex}:=->[DOCUMENTS:7]DOC_LOCATION:22  //this is only used to control the column type
													$_ptr_ArrayFormulas->{$_l_FIeldIndex}:=$_T_Script
												End if 
											Else 
												//TRACE
												EXECUTE FORMULA:C63("VTextNUM:="+$_T_Script)
												VText_2:=String:C10(VTextNUM)
												Vptr:=->Vtext_2
												//$_ptr_ArrayFieldPointers->{$_l_FIeldIndex}:=Vptr
												$_bo_TypeIsSet:=True:C214
												$_l_FieldType:=Is real:K8:4
												If ($_ptr_areaTypeVariable->=4)
													$_ptr_ArrayFieldPointers->{$_l_FIeldIndex}:=->[INVOICES:39]Total_Due:7  //this is only used to control the column type
													$_ptr_ArrayFormulas->{$_l_FIeldIndex}:=$_T_Script
												End if 
											End if 
											
											
										End if 
										
										
									End if 
									
								End if 
							End if 
							
							
							
						Else 
							$_ptr_ArrayFieldPointers->{$_l_FIeldIndex}:=Field:C253($_al_TableNumber{$_l_FIeldIndex}; $_al_FieldNumber{$_l_FIeldIndex})
						End if 
					End if 
				Else 
					
					//This is an array based based on arrays
					$_l_ReturnArrayType:=-1
					$_ptr_ArrayFieldPointers->{$_l_FIeldIndex}:=Get pointer:C304($_at_AssociatedArrayName{$_l_FIeldIndex})
				End if 
				If ($_bo_TypeIsSet=False:C215)
					$_l_FieldType:=Type:C295(($_ptr_ArrayFieldPointers->{$_l_FIeldIndex})->)
				End if 
				
				
				
				
				Case of   //types in approx order of frequency of use
					: (($_l_FieldType=0) | ($_l_FieldType=24))
						$_l_NextTextArray:=$_l_NextTextArray+1
						If ($_l_NextTextArray>32)  //Modified NG April 2004
							$_t_DeleteTitle:=LBi_InclFldDel($_t_DeleteTitle; $1; $_l_FIeldIndex)
							DELETE FROM ARRAY:C228($_al_TableNumber; $_l_FIeldIndex; 1)
							DELETE FROM ARRAY:C228($_al_FieldNumber; $_l_FIeldIndex; 1)
							$_l_ArraySIze:=$_l_ArraySIze-1
						Else 
							$_ptr_ArrayArrayNames->{$_l_FIeldIndex}:="LB_at_"+$_t_LevelID+"_"+String:C10($_l_NextTextArray)
							$_ptr_ArrayArrayPointers->{$_l_FIeldIndex}:=LBi_GetPtrStri($_t_LevelID; $_l_NextTextArray)  //Get pointer($_ptr_ArrayArrayNames»{$_l_FIeldIndex})
							$_l_FIeldIndex:=$_l_FIeldIndex+1
							
						End if 
					: ($_l_FieldType=14) | ($_l_FieldType=19) | ($_l_FieldType=21) | ($_l_FieldType=16) | ($_l_FieldType=17) | ($_l_FieldType=15) | ($_l_FieldType=22) | ($_l_FieldType=18)  //pointer to array
						//NOTE YOU CANNOT MIX ARRAYS and fields in the setup
						RESOLVE POINTER:C394($_ptr_ArrayFieldPointers->{$_l_FIeldIndex}; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
						$_ptr_ArrayArrayNames->{$_l_FIeldIndex}:=$_t_VariableName
						$_ptr_ArrayArrayPointers->{$_l_FIeldIndex}:=$_ptr_ArrayFieldPointers->{$_l_FIeldIndex}  //Get pointer($_ptr_ArrayArrayNames»{$_l_FIeldIndex})
						$_l_FIeldIndex:=$_l_FIeldIndex+1
						$_l_ArraysCount:=$_l_ArraysCount+1
						
					: ($_l_FieldType=1)
						$_l_NextRealArray:=$_l_NextRealArray+1
						If ($_l_NextRealArray>32)  //Modified NG April 2004
							$_t_DeleteTitle:=LBi_InclFldDel($_t_DeleteTitle; $1; $_l_FIeldIndex)
							DELETE FROM ARRAY:C228($_al_TableNumber; $_l_FIeldIndex; 1)
							DELETE FROM ARRAY:C228($_al_FieldNumber; $_l_FIeldIndex; 1)
							$_l_ArraySIze:=$_l_ArraySIze-1
						Else 
							$_ptr_ArrayArrayNames->{$_l_FIeldIndex}:="LB_ar_"+$_t_LevelID+"_"+String:C10($_l_NextRealArray)
							$_ptr_ArrayArrayPointers->{$_l_FIeldIndex}:=LBi_GetPtrReal($_t_LevelID; $_l_NextRealArray)  //Get pointer($_ptr_ArrayArrayNames»{$_l_FIeldIndex})
							$_l_FIeldIndex:=$_l_FIeldIndex+1
						End if 
					: ($_l_FieldType=3)  //added June 2007
						$_l_NextPictureArray:=$_l_NextPictureArray+1
						If ($_l_NextPictureArray>32)
							$_t_DeleteTitle:=LBi_InclFldDel($_t_DeleteTitle; $1; $_l_FIeldIndex)
							DELETE FROM ARRAY:C228($_al_TableNumber; $_l_FIeldIndex; 1)
							DELETE FROM ARRAY:C228($_al_FieldNumber; $_l_FIeldIndex; 1)
							$_l_ArraySIze:=$_l_ArraySIze-1
						Else 
							$_ptr_ArrayArrayNames->{$_l_FIeldIndex}:="LB_aPic_"+$_t_LevelID+"_"+String:C10($_l_NextPictureArray)
							$_ptr_ArrayArrayPointers->{$_l_FIeldIndex}:=LBI_GetPtrPICT($_t_LevelID; $_l_NextPictureArray)  //Get pointer($_ptr_ArrayArrayNames»{$_l_FIeldIndex})
							$_l_FIeldIndex:=$_l_FIeldIndex+1
						End if 
						
					: ($_l_FieldType=Is longint:K8:6)
						$_l_NextLongintArray:=$_l_NextLongintArray+1
						If ($_l_NextLongintArray>32)  //Modified NG April 2004
							$_t_DeleteTitle:=LBi_InclFldDel($_t_DeleteTitle; $1; $_l_FIeldIndex)
							DELETE FROM ARRAY:C228($_al_TableNumber; $_l_FIeldIndex; 1)
							DELETE FROM ARRAY:C228($_al_FieldNumber; $_l_FIeldIndex; 1)
							$_l_ArraySIze:=$_l_ArraySIze-1
						Else 
							$_ptr_ArrayArrayNames->{$_l_FIeldIndex}:="LB_al_"+$_t_LevelID+"_"+String:C10($_l_NextLongintArray)
							$_ptr_ArrayArrayPointers->{$_l_FIeldIndex}:=LBi_GetPtrLong($_t_LevelID; $_l_NextLongintArray)  //Get pointer($_ptr_ArrayArrayNames»{$_l_FIeldIndex})
							$_l_FIeldIndex:=$_l_FIeldIndex+1
						End if 
					: ($_l_FieldType=Is time:K8:8)
						$_l_NextTImeArray:=$_l_NextTImeArray+1
						If ($_l_NextTImeArray>32)  //Modified NG April 2004
							$_t_DeleteTitle:=LBi_InclFldDel($_t_DeleteTitle; $1; $_l_FIeldIndex)
							DELETE FROM ARRAY:C228($_al_TableNumber; $_l_FIeldIndex; 1)
							DELETE FROM ARRAY:C228($_al_FieldNumber; $_l_FIeldIndex; 1)
							$_l_ArraySIze:=$_l_ArraySIze-1
						Else 
							$_ptr_ArrayArrayNames->{$_l_FIeldIndex}:="LB_aTi_"+$_t_LevelID+"_"+String:C10($_l_NextTImeArray)
							$_ptr_ArrayArrayPointers->{$_l_FIeldIndex}:=LBi_GetPtrtime($_t_LevelID; $_l_NextTImeArray)  //Get pointer($_ptr_ArrayArrayNames»{$_l_FIeldIndex})
							$_l_FIeldIndex:=$_l_FIeldIndex+1
						End if 
					: ($_l_FieldType=4)
						$_l_NextDateArray:=$_l_NextDateArray+1
						If ($_l_NextDateArray>32)  //Modified NG April 2004
							$_t_DeleteTitle:=LBi_InclFldDel($_t_DeleteTitle; $1; $_l_FIeldIndex)
							DELETE FROM ARRAY:C228($_al_TableNumber; $_l_FIeldIndex; 1)
							DELETE FROM ARRAY:C228($_al_FieldNumber; $_l_FIeldIndex; 1)
							$_l_ArraySIze:=$_l_ArraySIze-1
						Else 
							$_ptr_ArrayArrayNames->{$_l_FIeldIndex}:="LB_ad_"+$_t_LevelID+"_"+String:C10($_l_NextDateArray)
							$_ptr_ArrayArrayPointers->{$_l_FIeldIndex}:=LBi_GetPtrDate($_t_LevelID; $_l_NextDateArray)  //Get Pointer($_ptr_ArrayArrayNames»{$_l_FIeldIndex})
							$_l_FIeldIndex:=$_l_FIeldIndex+1
						End if 
					: ($_l_FieldType=8)
						$_l_NextIntegerArray:=$_l_NextIntegerArray+1
						If ($_l_NextIntegerArray>32)  //Modified NG April 2004
							$_t_DeleteTitle:=LBi_InclFldDel($_t_DeleteTitle; $1; $_l_FIeldIndex)
							DELETE FROM ARRAY:C228($_al_TableNumber; $_l_FIeldIndex; 1)
							DELETE FROM ARRAY:C228($_al_FieldNumber; $_l_FIeldIndex; 1)
							$_l_ArraySIze:=$_l_ArraySIze-1
						Else 
							$_ptr_ArrayArrayNames->{$_l_FIeldIndex}:="LB_ai_"+$_t_LevelID+"_"+String:C10($_l_NextIntegerArray)
							$_ptr_ArrayArrayPointers->{$_l_FIeldIndex}:=LBi_GetPtrInteger($_t_LevelID; $_l_NextIntegerArray)  //Get pointer($_ptr_ArrayArrayNames»{$_l_FIeldIndex})
							$_l_FIeldIndex:=$_l_FIeldIndex+1
						End if 
					: ($_l_FieldType=6)
						$_l_NextBooleanArray:=$_l_NextBooleanArray+1
						If ($_l_NextBooleanArray>32)  //Modified NG April 2004
							$_t_DeleteTitle:=LBi_InclFldDel($_t_DeleteTitle; $1; $_l_FIeldIndex)
							DELETE FROM ARRAY:C228($_al_TableNumber; $_l_FIeldIndex; 1)
							DELETE FROM ARRAY:C228($_al_FieldNumber; $_l_FIeldIndex; 1)
							$_l_ArraySIze:=$_l_ArraySIze-1
						Else 
							$_ptr_ArrayArrayNames->{$_l_FIeldIndex}:="LB_abo_"+$_t_LevelID+"_"+String:C10($_l_NextBooleanArray)
							$_ptr_ArrayArrayPointers->{$_l_FIeldIndex}:=LBi_GetPtrBoolean($_t_LevelID; $_l_NextBooleanArray)  //Get pointer($_ptr_ArrayArrayNames»{$_l_FIeldIndex})
							$_l_FIeldIndex:=$_l_FIeldIndex+1
						End if 
					: ($_l_FieldType=2)
						
						$_l_NextTextArray:=$_l_NextTextArray+1
						If ($_l_NextTextArray>32)  //Modified NG April 2004
							$_t_DeleteTitle:=LBi_InclFldDel($_t_DeleteTitle; $1; $_l_FIeldIndex)
							DELETE FROM ARRAY:C228($_al_TableNumber; $_l_FIeldIndex; 1)
							DELETE FROM ARRAY:C228($_al_FieldNumber; $_l_FIeldIndex; 1)
							$_l_ArraySIze:=$_l_ArraySIze-1
						Else 
							$_ptr_ArrayArrayNames->{$_l_FIeldIndex}:="LB_at_"+$_t_LevelID+"_"+String:C10($_l_NextTextArray)
							$_ptr_ArrayArrayPointers->{$_l_FIeldIndex}:=LBi_GetPtrTEXT($_t_LevelID; $_l_NextTextArray)  //Get pointer($_ptr_ArrayArrayNames»{$_l_FIeldIndex})
							$_l_FIeldIndex:=$_l_FIeldIndex+1
						End if 
						
					Else 
						$_t_DeleteTitle:=LBi_InclFldDel($_t_DeleteTitle; $1; $_l_FIeldIndex)
						DELETE FROM ARRAY:C228($_al_TableNumber; $_l_FIeldIndex; 1)
						DELETE FROM ARRAY:C228($_al_FieldNumber; $_l_FIeldIndex; 1)
						DELETE FROM ARRAY:C228($_at_AssociatedArrayName; $_l_FIeldIndex; 1)
						$_l_ArraySIze:=$_l_ArraySIze-1
				End case 
				If ((($_l_FIeldIndex-1)<=$_l_ArraySIze) & ($_ptr_ArrayReferences->{8}=""))  //not if is a subfile
					If (($_ptr_ArrayFieldPointers->{$_l_FIeldIndex-1}=$1->{8}) & ($_l_KeyFieldNumber=0))
						$_l_KeyFieldNumber:=$_l_FIeldIndex-1
					End if 
				End if 
				
			End while 
			
			If ($_t_DeleteTitle#"")  //Delete the definition records if any excess
				Gen_Alert("The following columns were beyond the maximums"+" available, or were of an invalid field type,"+" and have been deleted:"+Char:C90(13)+$_t_DeleteTitle; "OK")
				vT:=$_t_DeleteTitle
				$_t_DeleteTitle:=First_Field(->vT; Char:C90(13))
				READ WRITE:C146([LIST_LAYOUTS:96])
				While ($_t_DeleteTitle#"")
					QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$_t_CurrentDefinitionsName)
					If (Records in selection:C76([LIST_LAYOUTS:96])=0)
						QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$_ptr_ArrayReferences->{6})
					End if 
					QUERY SELECTION:C341([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Title:4=$_t_DeleteTitle)
					DB_DeletionControl(->[LIST_LAYOUTS:96])
					
					DELETE RECORD:C58([LIST_LAYOUTS:96])
					$_t_DeleteTitle:=First_Field(->vT; Char:C90(13))
				End while 
			End if 
			
			If ($_l_KeyFieldNumber=0) & ($_l_ArraysCount<$_l_ArraySIze)  //If the Key Field No is not already defined
				$_l_KeyFieldNumber:=$_l_ArraySIze+1
				INSERT IN ARRAY:C227($_ptr_ArrayFieldPointers->; $_l_KeyFieldNumber; 1)  //Create an extra column for it
				INSERT IN ARRAY:C227($_ptr_ArrayArrayPointers->; $_l_KeyFieldNumber; 1)
				INSERT IN ARRAY:C227($_ptr_ArrayArrayNames->; $_l_KeyFieldNumber; 1)
				INSERT IN ARRAY:C227($_ptr_ArrayFormatNames->; $_l_KeyFieldNumber; 1)
				INSERT IN ARRAY:C227($_ptr_ArrayFormulas->; $_l_KeyFieldNumber; 1)
				INSERT IN ARRAY:C227($_ptr_ArrayTitles->; $_l_KeyFieldNumber; 1)
				INSERT IN ARRAY:C227($_ptr_ArrayWidths->; $_l_KeyFieldNumber; 1)
				INSERT IN ARRAY:C227($_ptr_ArrayEnterability->; $_l_KeyFieldNumber; 1)
				INSERT IN ARRAY:C227($_ptr_ArrayColumnLock->; $_l_KeyFieldNumber; 1)
				INSERT IN ARRAY:C227($_ptr_ArrayFontSize->; $_l_KeyFieldNumber; 1)
				INSERT IN ARRAY:C227($_ptr_ArrayColors->; $_l_KeyFieldNumber; 1)
				INSERT IN ARRAY:C227($_ptr_ArrayFooters->; $_l_KeyFieldNumber; 1)
				INSERT IN ARRAY:C227($_ptr_ArrayRollovers->; $_l_KeyFieldNumber; 1)
				INSERT IN ARRAY:C227($_ptr_ArrayFontName->; $_l_KeyFieldNumber; 1)
				INSERT IN ARRAY:C227($_ptr_ArrayFontStyle->; $_l_KeyFieldNumber; 1)
				
				$_ptr_ArrayFieldPointers->{$_l_KeyFieldNumber}:=$1->{8}
				$_l_FieldType:=Type:C295(($1->{8})->)
				If (($_l_FieldType=8) | ($_l_FieldType=9) | ($_ptr_ArrayReferences->{8}#""))  //always Long if subfile
					$_l_NextLongintArray:=$_l_NextLongintArray+1
					$_ptr_ArrayArrayNames->{$_l_KeyFieldNumber}:="LB_al_"+$_t_LevelID+"_"+String:C10($_l_NextLongintArray)
					$_ptr_ArrayArrayPointers->{$_l_KeyFieldNumber}:=LBi_GetPtrLong($_t_LevelID; $_l_NextLongintArray)  //Get pointer($_ptr_ArrayArrayNames»{$_l_KeyFieldNumber})
					
				Else 
					$_l_NextTextArray:=$_l_NextTextArray+1
					$_ptr_ArrayArrayNames->{$_l_KeyFieldNumber}:="LB_at_"+$_t_LevelID+"_"+String:C10($_l_NextTextArray)
					$_ptr_ArrayArrayPointers->{$_l_KeyFieldNumber}:=LBi_GetPtrStri($_t_LevelID; $_l_NextTextArray)  //Get pointer($_ptr_ArrayArrayNames»{$_l_KeyFieldNumber})
					
				End if 
				$_ptr_ArrayFormulas->{$_l_KeyFieldNumber}:=""
				$_ptr_ArrayTitles->{$_l_KeyFieldNumber}:="Key"
				$_ptr_ArrayWidths->{$_l_KeyFieldNumber}:=30
			End if 
			
			//record the arrays as interprocess to save time next time
			//◊aALRefs{$f}:=$_ptr_ArrayReferences->{6}
			//◊aALRef2{$f}:=$_ptr_ArrayReferences->{7}
			//COPY ARRAY($_ptr_ArrayFieldPointers->;◊aALpFldP{$f})
			//COPY ARRAY($_ptr_ArrayFormatNames->;◊aALpForm{$f})
			//COPY ARRAY($_ptr_ArrayFormulas->;◊aALpFmul{$f})
			//COPY ARRAY($_ptr_ArrayTitles->;◊aALpTitl{$f})
			//COPY ARRAY($_ptr_ArrayWidths->;◊aALpWidt{$f})
			//COPY ARRAY($_ptr_ArrayEnterability->;◊aALpEnte{$f})
			//COPY ARRAY($_ptr_ArrayColumnLock->;◊aALpLock{$f})
			//COPY ARRAY($_ptr_ArrayFontSize->;◊aALpFont{$f})
			//COPY ARRAY($_ptr_ArrayColors->;◊aALpColo{$f})
			//COPY ARRAY($_ptr_ArrayFooters->;◊aALpFoot{$f})
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("LBi_InclFields"; $_t_oldMethodName)