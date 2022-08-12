//%attributes = {}
If (False:C215)
	//Project Method Name:      LBi_InclFIeldArr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 2010/01/14 2:48 PM
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(<>aALaType;0)
	//ARRAY POINTER(<>AA_aPo_FieldPointer;0)
	C_LONGINT:C283($_l_BooleanColumn; $_l_DataType; $_l_DateColumn; $_l_FieldNumber; $_l_Index; $_l_IntegerColumn; $_l_LongintColumn; $_l_NumberofColumns; $_l_PictureColumn; $_l_RealsColumn; $_l_StringColumn)
	C_LONGINT:C283($_l_TableNumber; $_l_TextColumn; $_l_TimeColumn; $2)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayOfArrayNames; $_ptr_ArrayofArrayPointers; $_ptr_ArrayOfColumFormats; $_ptr_ArrayofColumnColors; $_ptr_ArrayofColumnFonts; $_ptr_ArrayofColumnFooters; $_Ptr_ArrayofColumnFormulas; $_ptr_ArrayofColumnLabels; $_ptr_ArrayofColumnLockFlags; $_ptr_ArrayofColumnWIdths)
	C_POINTER:C301($_ptr_ArrayReferences; $_ptr_EnterabilityArray; $_Ptr_KeyField; $_ptr_LBTable; $_ptr_ListboxSetup; $1)
	C_TEXT:C284($_t_AreaHandlingSettings; $_t_BackgroundColourName; $_t_DataEditFormName; $_t_LevelID; $_t_oldMethodName; $_t_OnEditMethod; $_t_VariableName; DB_t_Methodname)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_InclFIeldArr")
DB_t_Methodname:=Current method name:C684
//ALInclFieldArr  - loads the arrays from InterProcess_Arrays
//see also ALInclFields & ALStartBack2
//$_ptr_ArrayReferences = Ptr to Array of Pointers
//$2 = position in interProcess_Array
If (Count parameters:C259>=2)
	If ($2>0)
		If (Size of array:C274(<>AA_aPo_FieldPointer)>=$2)
			If (GenValidatePointer($_ptr_ArrayReferences))
				While (Semaphore:C143("$Inserting"+"ALREFS"))
					DelayTicks
				End while 
				$_ptr_ListboxSetup:=$1
				$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
				$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
				$_ptr_ArrayOfArrayNames:=$_ptr_ListboxSetup->{4}
				$_ptr_ArrayOfColumFormats:=$_ptr_ListboxSetup->{5}
				$_Ptr_ArrayofColumnFormulas:=$_ptr_ListboxSetup->{6}
				$_ptr_LBTable:=$_ptr_ListBoxSetup->{7}
				$_Ptr_KeyField:=$_ptr_ListBoxSetup->{8}
				$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
				$_ptr_LBTable:=$_ptr_ListboxSetup->{10}
				$_ptr_ArrayofColumnLabels:=$_ptr_ListboxSetup->{12}
				$_ptr_ArrayofColumnWIdths:=$_ptr_ListboxSetup->{13}
				$_ptr_EnterabilityArray:=$_ptr_ListboxSetup->{14}
				$_ptr_ArrayofColumnLockFlags:=$_ptr_ListboxSetup->{15}
				$_ptr_ArrayofColumnFonts:=$_ptr_ListboxSetup->{16}
				$_ptr_ArrayofColumnColors:=$_ptr_ListboxSetup->{17}
				$_ptr_ArrayofColumnFooters:=$_ptr_ListboxSetup->{18}
				
				$_t_LevelID:=$_ptr_ArrayReferences->{1}
				$_t_BackgroundColourName:=$_ptr_ArrayReferences->{2}
				$_t_OnEditMethod:=$_ptr_ArrayReferences->{3}
				$_t_AreaHandlingSettings:=$_ptr_ArrayReferences->{4}
				//Ref Settings works like this
				//4=several params in 1: each character:
				//   1=4 or 2 for Select or Enter
				//   2=0,1 or 2 for Non-resizable, Resizable or Resize needs updating
				//   3=0, 1 or 2 for Locking
				//   4=...for Column dragging
				//   5=...for Definitions
				//   6=...for Column Sorting
				//   7=...for Row Dragging
				//   8/9=...field number of Sort Order field if 7 is valid
				$_t_DataEditFormName:=$_ptr_ArrayReferences->{6}
				
				//COPY ARRAY(◊aALpFldP{$2};$_ptr_ArrayFieldPointers->)
				//COPY ARRAY(◊aALpForm{$2};$_ptr_ArrayOfColumFormats->)
				//COPY ARRAY(◊aALpFmul{$2};$_Ptr_ArrayofColumnFormulas->)
				//COPY ARRAY(◊aALpTitl{$2};$_ptr_ArrayofColumnLabels->)
				//COPY ARRAY(◊aALpWidt{$2};$_ptr_ArrayofColumnWIdths->)
				//COPY ARRAY(◊aALpEnte{$2};$_ptr_EnterabilityArray->)
				//COPY ARRAY(◊aALpLock{$2};$_ptr_ArrayofColumnLockFlags->)
				//COPY ARRAY(◊aALpFont{$2};$_ptr_ArrayofColumnFonts->)
				//COPY ARRAY(◊aALpColo{$2};$_ptr_ArrayofColumnColors->)
				//COPY ARRAY(◊aALpFoot{$2};$_ptr_ArrayofColumnFooters->)
				
				$_l_NumberofColumns:=Size of array:C274($_ptr_ArrayFieldPointers->)
				//$_ptr_ArrayReferences->{7}:=<>aALRef2{$2}  //set the current ref to the one being used
				
				INSERT IN ARRAY:C227($_ptr_ArrayofArrayPointers->; 1; $_l_NumberofColumns)
				INSERT IN ARRAY:C227($_ptr_ArrayOfArrayNames->; 1; $_l_NumberofColumns)
				
				$_l_StringColumn:=0  //String
				$_l_TextColumn:=0  // text
				$_l_RealsColumn:=0  //Real
				$_l_DateColumn:=0  //Date
				$_l_BooleanColumn:=0  //Boolean
				$_l_IntegerColumn:=0  //Integer
				$_l_LongintColumn:=0  //Longint
				$_l_TimeColumn:=0  //time
				$_l_PictureColumn:=0  //picture
				
				//load in the array names and ptrs to be used for each column
				For ($_l_Index; 1; $_l_NumberofColumns)
					$_l_DataType:=0  //<>aALaType{$2}{$_l_Index}
					Case of   //types in approx order of frequency of use
						: ($_l_DataType=14) | ($_l_DataType=19) | ($_l_DataType=21) | ($_l_DataType=16) | ($_l_DataType=17) | ($_l_DataType=15) | ($_l_DataType=22) | ($_l_DataType=18)  //pointer to array
							RESOLVE POINTER:C394($_ptr_ArrayFieldPointers->{$_l_Index}; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
							$_ptr_ArrayOfArrayNames->{$_l_Index}:=$_t_VariableName
							$_ptr_ArrayofArrayPointers->{$_l_Index}:=$_ptr_ArrayFieldPointers->{$_l_Index}  //Get pointer($_ptr_ArrayOfArrayNames»{$_l_Index})
							
							
						: (($_l_DataType=0) | ($_l_DataType=24))
							$_l_StringColumn:=$_l_StringColumn+1
							$_ptr_ArrayOfArrayNames->{$_l_Index}:="LB_at_"+$_t_LevelID+"_"+String:C10($_l_StringColumn)
							$_ptr_ArrayofArrayPointers->{$_l_Index}:=LBi_GetPtrStri($_t_LevelID; $_l_StringColumn)  //Get pointer($_ptr_ArrayOfArrayNames»{$_l_Index})
						: ($_l_DataType=1)
							$_l_RealsColumn:=$_l_RealsColumn+1
							$_ptr_ArrayOfArrayNames->{$_l_Index}:="LB_ar_"+$_t_LevelID+"_"+String:C10($_l_RealsColumn)
							$_ptr_ArrayofArrayPointers->{$_l_Index}:=LBi_GetPtrReal($_t_LevelID; $_l_RealsColumn)  //Get pointer($_ptr_ArrayOfArrayNames»{$_l_Index})
						: ($_l_DataType=Is picture:K8:10)
							$_l_PictureColumn:=$_l_PictureColumn+1
							$_ptr_ArrayOfArrayNames->{$_l_Index}:="LB_aPic_"+$_t_LevelID+"_"+String:C10($_l_PictureColumn)
							$_ptr_ArrayofArrayPointers->{$_l_Index}:=LBI_GetPtrPICT($_t_LevelID; $_l_PictureColumn)  //Get pointer($_ptr_ArrayOfArrayNames»{$_l_Index})
						: (($_l_DataType=Is longint:K8:6))
							$_l_LongintColumn:=$_l_LongintColumn+1
							$_ptr_ArrayOfArrayNames->{$_l_Index}:="LB_al_"+$_t_LevelID+"_"+String:C10($_l_LongintColumn)
							$_ptr_ArrayofArrayPointers->{$_l_Index}:=LBi_GetPtrLong($_t_LevelID; $_l_LongintColumn)  //Get pointer($_ptr_ArrayOfArrayNames»{$_l_Index})
						: ($_l_DataType=Is time:K8:8)
							$_l_TimeColumn:=$_l_TimeColumn+1
							$_ptr_ArrayOfArrayNames->{$_l_Index}:="LB_ati_"+$_t_LevelID+"_"+String:C10($_l_LongintColumn)
							$_ptr_ArrayofArrayPointers->{$_l_Index}:=LBi_GetPtrtime($_t_LevelID; $_l_TimeColumn)  //Get pointer($_ptr_ArrayOfArrayNames»{$_l_Index})
							
							
						: ($_l_DataType=Is date:K8:7)
							$_l_DateColumn:=$_l_DateColumn+1
							$_ptr_ArrayOfArrayNames->{$_l_Index}:="LB_ad_"+$_t_LevelID+"_"+String:C10($_l_DateColumn)
							$_ptr_ArrayofArrayPointers->{$_l_Index}:=LBi_GetPtrDate($_t_LevelID; $_l_DateColumn)  //Get Pointer($_ptr_ArrayOfArrayNames»{$_l_Index})
						: ($_l_DataType=Is integer:K8:5)
							$_l_IntegerColumn:=$_l_IntegerColumn+1
							$_ptr_ArrayOfArrayNames->{$_l_Index}:="LB_ai_"+$_t_LevelID+"_"+String:C10($_l_IntegerColumn)
							$_ptr_ArrayofArrayPointers->{$_l_Index}:=LBi_GetPtrInteger($_t_LevelID; $_l_IntegerColumn)  //Get pointer($_ptr_ArrayOfArrayNames»{$_l_Index})
							
						: ($_l_DataType=Is boolean:K8:9)
							$_l_BooleanColumn:=$_l_BooleanColumn+1
							$_ptr_ArrayOfArrayNames->{$_l_Index}:="LB_abo_"+$_t_LevelID+"_"+String:C10($_l_BooleanColumn)
							$_ptr_ArrayofArrayPointers->{$_l_Index}:=LBi_GetPtrBoolean($_t_LevelID; $_l_BooleanColumn)  //Get pointer($_ptr_ArrayOfArrayNames»{$_l_Index})
						: ($_l_DataType=Is text:K8:3)
							$_l_TextColumn:=$_l_TextColumn+1
							$_ptr_ArrayOfArrayNames->{$_l_Index}:="LB_at_"+$_t_LevelID+"Text"+String:C10($_l_TextColumn)
							$_ptr_ArrayofArrayPointers->{$_l_Index}:=LBi_GetPtrTEXT($_t_LevelID; $_l_TextColumn)  //Get pointer($_ptr_ArrayOfArrayNames»{$_l_Index})
					End case 
				End for 
				CLEAR SEMAPHORE:C144("$Inserting"+"ALREFS")
				
				
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("LBi_InclFIeldArr"; $_t_oldMethodName)