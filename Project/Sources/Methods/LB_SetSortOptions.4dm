//%attributes = {}
If (False:C215)
	//Project Method Name:      LB_SetSortOptions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	C_LONGINT:C283($_l_Index; $_l_ListboxColumns; $2; $3; $4)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LB_SetSortOptions")
//This method is to mimic the area list AL_setSortOptions command
//AL_SetSortOpts (AreaName;SortInDuring;UserSort;AllowSortEditor;SortEditorPrompt;ShowSortOrder;ShowSortDirIndicator)
ARRAY TEXT:C222($_at_ColumnNames; 0)
ARRAY TEXT:C222($_at_HeaderNames; 0)
ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
LISTBOX GET ARRAYS:C832($1->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)

//$3=Dynamic Sort '(Sort in During') 0=No 1=Yes
//$4=User Sort( allow user sorting 0=No 1=Yes)
//Note there is no sort editor
//$5=Show Sort order 0=no 1=yes
//if the sort order is shown the direction is shown
//$Ref:=Find in array(LB_l_ListBoxRefs;$1->)
//LB_l_ListBoxSettings{$ref}{1}:=$3
//LB_l_ListBoxSettings{$ref}{2}:=$4
//LB_l_ListBoxSettings{$ref}{3}:=$5
Case of 
	: ($2=0)
		Case of 
			: (Count parameters:C259=2)
				//No user sorting
				$_l_ListboxColumns:=LISTBOX Get number of columns:C831($1->)
				For ($_l_Index; 1; $_l_ListboxColumns)
					OBJECT SET ENABLED:C1123($_aptr_HeaderVariables{$_l_Index}->; False:C215)
					
					//_O_DISABLE BUTTON($_aptr_HeaderVariables{$_l_Index}->)
					
				End for 
			: (Count parameters:C259=3)
				If ($3>0)
					If ($3<Size of array:C274($_aptr_HeaderVariables))
						OBJECT SET ENABLED:C1123($_aptr_HeaderVariables{$3}->; False:C215)
						//_O_DISABLE BUTTON($_aptr_HeaderVariables{$3}->)
					End if 
				End if 
			: (Count parameters:C259>=4)
				If ($3>0) & ($4>0)
					If ($3<Size of array:C274($_aptr_HeaderVariables)) & ($4<Size of array:C274($_aptr_HeaderVariables))
						For ($_l_Index; $3; $4)
							OBJECT SET ENABLED:C1123($_aptr_HeaderVariables{$_l_Index}->; False:C215)
							
						End for 
					End if 
				End if 
		End case 
	: ($2=1)
		//user sorting
		Case of 
			: (Count parameters:C259=2)
				$_l_ListboxColumns:=LISTBOX Get number of columns:C831($1->)
				For ($_l_Index; 1; $_l_ListboxColumns)
					OBJECT SET ENABLED:C1123($_aptr_HeaderVariables{$_l_Index}->; True:C214)
					
					//_O_ENABLE BUTTON($_aptr_HeaderVariables{$_l_Index}->)
					
				End for 
			: (Count parameters:C259=3)
				If ($3>0)
					If ($3<Size of array:C274($_aptr_HeaderVariables))
						OBJECT SET ENABLED:C1123($_aptr_HeaderVariables{$3}->; True:C214)
						
						//_O_ENABLE BUTTON($_aptr_HeaderVariables{$3}->)
					End if 
				End if 
			: (Count parameters:C259>=4)
				If ($3>0) & ($4>0)
					If ($3<Size of array:C274($_aptr_HeaderVariables)) & ($4<Size of array:C274($_aptr_HeaderVariables))
						For ($_l_Index; $3; $4)
							OBJECT SET ENABLED:C1123($_aptr_HeaderVariables{$_l_Index}->; True:C214)
							
							//_O_ENABLE BUTTON($_aptr_HeaderVariables{$_l_Index}->)
							
						End for 
					End if 
				End if 
		End case 
		
		
End case 
ERR_MethodTrackerReturn("LB_SetSortOptions"; $_t_oldMethodName)