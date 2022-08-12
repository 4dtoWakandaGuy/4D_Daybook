//%attributes = {}
If (False:C215)
	//Project Method Name:      LBi_pRefs4upd
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/02/2010 17:33
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_FieldNumber; 0)
	ARRAY LONGINT:C221($_al_FieldOrder; 0)
	ARRAY LONGINT:C221($_al_TableNumber; 0)
	ARRAY TEXT:C222($_at_DefinitionsReference; 0)
	C_BOOLEAN:C305(<>PER_bo_LbDefinitiionsInited)
	C_LONGINT:C283($_l_Index; $_l_KeyPosition; $_l_RecordsinSelection; $_l_SizeofArray; vALLevels)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_ptr_ArrayOfColumFormats; $_ptr_ArrayofColumnColors; $_ptr_ArrayofColumnFonts; $_ptr_ArrayofColumnFooters; $_Ptr_ArrayofColumnFormulas; $_ptr_ArrayofColumnLabels; $_ptr_ArrayofColumnLockFlags; $_ptr_ArrayofColumnWIdths; $_ptr_ArrayReferences)
	C_POINTER:C301($_ptr_EnterabilityArray; $_Ptr_KeyField; $_ptr_LBTable; $_ptr_ListBoxSetup; $_Ptr_ThisColumnArray; $1)
	C_TEXT:C284($_t_AreaHandlingSettings; $_t_CurrentDefinitionsName; $_t_CurrentUserDefinitionsName; $_t_DefinitionsReference; $_t_oldMethodName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("LBi_pRefs4upd")

//NG 19/7/2006 this method is a direct replacement for AlpRefs4upd

//ALpRefs4Upd - Update the changes made to Col Sizes, Locking, positions etc

If (vALLevels>0)
	If (<>PER_bo_LbDefinitiionsInited)
		$_ptr_ListBoxSetup:=$1
		If (Size of array:C274($_ptr_ListBoxSetup->)>0)
			$_ptr_ArrayReferences:=$_ptr_ListBoxSetup->{9}
			$_t_AreaHandlingSettings:=$_ptr_ArrayReferences->{4}
			
			If ((Substring:C12($_t_AreaHandlingSettings; 2; 1)="2") | (Substring:C12($_t_AreaHandlingSettings; 3; 1)="2") | (Substring:C12($_t_AreaHandlingSettings; 4; 1)="2"))
				
				LBi_DelBckgrdElem($_ptr_ListBoxSetup)
				$_ptr_ArrayFieldPointers:=$_ptr_ListBoxSetup->{2}
				$_ptr_ArrayOfColumFormats:=$_ptr_ListBoxSetup->{5}
				$_Ptr_ArrayofColumnFormulas:=$_ptr_ListBoxSetup->{6}
				$_ptr_ArrayofColumnLabels:=$_ptr_ListBoxSetup->{12}
				$_ptr_ArrayofColumnWIdths:=$_ptr_ListBoxSetup->{13}
				$_ptr_EnterabilityArray:=$_ptr_ListBoxSetup->{14}
				$_ptr_ArrayofColumnLockFlags:=$_ptr_ListBoxSetup->{15}
				$_ptr_ArrayofColumnFonts:=$_ptr_ListBoxSetup->{16}
				$_ptr_ArrayofColumnColors:=$_ptr_ListBoxSetup->{17}
				$_ptr_ArrayofColumnFooters:=$_ptr_ListBoxSetup->{18}
				
				$_t_CurrentDefinitionsName:=$_ptr_ArrayReferences->{6}
				$_t_CurrentUserDefinitionsName:=$_ptr_ArrayReferences->{7}
				MESSAGES OFF:C175
				READ WRITE:C146([LIST_LAYOUTS:96])
				LBi_ListFindDup($_t_CurrentDefinitionsName; $_t_CurrentDefinitionsName)
				$_t_DefinitionsReference:=[LIST_LAYOUTS:96]Layout_Reference:1
				//NG-this is sensless!! but hey ho
				
				//  DELETE SELECTION([LIST LAYOUTS])` commented out NG
				CREATE SET:C116([LIST_LAYOUTS:96]; "TEMP1")
				$_l_SizeofArray:=Size of array:C274($_ptr_ArrayFieldPointers->)
				If ($_ptr_ArrayofColumnLabels->{$_l_SizeofArray}="Key")  //Don't create the Key Column record
					$_l_SizeofArray:=$_l_SizeofArray-1
				End if 
				ARRAY TEXT:C222($_at_DefinitionsReference; $_l_SizeofArray)
				ARRAY LONGINT:C221($_al_TableNumber; $_l_SizeofArray)
				ARRAY LONGINT:C221($_al_FieldNumber; $_l_SizeofArray)
				ARRAY LONGINT:C221($_al_FieldOrder; $_l_SizeofArray)
				
				For ($_l_Index; 1; $_l_SizeofArray)
					$_at_DefinitionsReference{$_l_Index}:=$_t_DefinitionsReference
					$_al_TableNumber{$_l_Index}:=Table:C252($_ptr_ArrayFieldPointers->{$_l_Index})
					$_al_FieldNumber{$_l_Index}:=Field:C253($_ptr_ArrayFieldPointers->{$_l_Index})
					$_al_FieldOrder{$_l_Index}:=$_l_Index
				End for 
				If (False:C215)  //ng
					REDUCE SELECTION:C351([LIST_LAYOUTS:96]; 0)  //added NG october 2000
					
					ARRAY TO SELECTION:C261($_at_DefinitionsReference; [LIST_LAYOUTS:96]Layout_Reference:1; $_al_TableNumber; [LIST_LAYOUTS:96]Table_Number:2; $_al_FieldNumber; [LIST_LAYOUTS:96]Field_Number:3; $_ptr_ArrayofColumnLabels->; [LIST_LAYOUTS:96]Title:4; $_ptr_ArrayofColumnWIdths->; [LIST_LAYOUTS:96]Width:5; $_ptr_ArrayOfColumFormats->; [LIST_LAYOUTS:96]Format:6; $_al_FieldOrder; [LIST_LAYOUTS:96]Order:7; $_ptr_EnterabilityArray->; [LIST_LAYOUTS:96]Enterable:8; $_Ptr_ArrayofColumnFormulas->; [LIST_LAYOUTS:96]Formula:9; $_ptr_ArrayofColumnLockFlags->; [LIST_LAYOUTS:96]Locked:10; $_ptr_ArrayofColumnFonts->; [LIST_LAYOUTS:96]Font_Size:11; $_ptr_ArrayofColumnColors->; [LIST_LAYOUTS:96]Colour:12; $_ptr_ArrayofColumnFooters->; [LIST_LAYOUTS:96]Footer:14)
				End if 
				USE SET:C118("TEMP1")
				CREATE EMPTY SET:C140([LIST_LAYOUTS:96]; "TEMP2")
				$_l_RecordsinSelection:=Records in selection:C76([LIST_LAYOUTS:96])
				
				For ($_l_Index; 1; Size of array:C274($_at_DefinitionsReference))
					If ($_l_Index>$_l_RecordsinSelection)
						CREATE RECORD:C68([LIST_LAYOUTS:96])
					End if 
					[LIST_LAYOUTS:96]Layout_Reference:1:=$_at_DefinitionsReference{$_l_Index}
					[LIST_LAYOUTS:96]Table_Number:2:=$_al_TableNumber{$_l_Index}
					[LIST_LAYOUTS:96]Field_Number:3:=$_al_FieldNumber{$_l_Index}
					[LIST_LAYOUTS:96]Title:4:=$_ptr_ArrayofColumnLabels->{$_l_Index}
					[LIST_LAYOUTS:96]Width:5:=$_ptr_ArrayofColumnWIdths->{$_l_Index}
					[LIST_LAYOUTS:96]Format:6:=$_ptr_ArrayOfColumFormats->{$_l_Index}
					[LIST_LAYOUTS:96]Order:7:=$_al_FieldOrder{$_l_Index}
					[LIST_LAYOUTS:96]Enterable:8:=$_ptr_EnterabilityArray->{$_l_Index}
					[LIST_LAYOUTS:96]Formula:9:=Macro_translate($_Ptr_ArrayofColumnFormulas->{$_l_Index})
					[LIST_LAYOUTS:96]Locked:10:=$_ptr_ArrayofColumnLockFlags->{$_l_Index}
					[LIST_LAYOUTS:96]Font_Size:11:=$_ptr_ArrayofColumnFonts->{$_l_Index}
					[LIST_LAYOUTS:96]Colour:12:=$_ptr_ArrayofColumnColors->{$_l_Index}
					[LIST_LAYOUTS:96]Footer:14:=$_ptr_ArrayofColumnFooters->{$_l_Index}
					DB_SaveRecord(->[LIST_LAYOUTS:96])
					ADD TO SET:C119([LIST_LAYOUTS:96]; "TEMP2")
					NEXT RECORD:C51([LIST_LAYOUTS:96])
				End for 
				If ($_l_RecordsinSelection>($_l_Index-1))
					//there were more records so delete the extras
					DIFFERENCE:C122("TEMP1"; "TEMP2"; "TEMP1")
					USE SET:C118("Temp1")
					DELETE SELECTION:C66([LIST_LAYOUTS:96])
				End if 
				CLEAR SET:C117("TEMP1")
				CLEAR SET:C117("TEMP2")
				
				
				
				
				
				
				
				READ ONLY:C145([LIST_LAYOUTS:96])
				UNLOAD RECORD:C212([LIST_LAYOUTS:96])
				MESSAGES ON:C181
				
				$_ptr_ArrayReferences->{4}:=Substring:C12($_ptr_ArrayReferences->{4}; 1; 1)+"111"+Substring:C12($_ptr_ArrayReferences->{4}; 5; 99)
			End if 
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("LBi_pRefs4upd"; $_t_oldMethodName)