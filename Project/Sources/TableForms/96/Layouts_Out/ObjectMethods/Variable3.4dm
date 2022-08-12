If (False:C215)
	//object Name: [LIST_LAYOUTS]Layouts_Out.Variable3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/11/2009 16:36
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_Enterable; 0)
	ARRAY BOOLEAN:C223($_abo_LockedColumn; 0)
	ARRAY INTEGER:C220($_ai_FontSize; 0)
	ARRAY INTEGER:C220($_ai_Width; 0)
	ARRAY INTEGER:C220($_ai_Footers; 0)
	ARRAY LONGINT:C221($_al_Field; 0)
	ARRAY LONGINT:C221($_al_FieldOrder; 0)
	ARRAY LONGINT:C221($_al_RelatedField; 0)
	ARRAY LONGINT:C221($_al_RelatedTable; 0)
	ARRAY LONGINT:C221($_al_Table; 0)
	ARRAY TEXT:C222($_at_arrayName; 0)
	ARRAY TEXT:C222($_at_ColumnColour; 0)
	ARRAY TEXT:C222($_at_Format; 0)
	ARRAY TEXT:C222($_at_Formula; 0)
	ARRAY TEXT:C222($_at_Identity; 0)
	ARRAY TEXT:C222($_at_Label; 0)
	ARRAY TEXT:C222($_at_Settings; 0)
	//ARRAY TEXT(SVS_at_PreviewEvent;0)
	C_LONGINT:C283($_l_Index; $_l_SIzeOfArray; vNo)
	C_TEXT:C284($_t_DefinitionReference; $_t_DefinitionReferenceFULL; $_t_oldMethodName; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [LIST_LAYOUTS].Layouts_Out.Variable3"; Form event code:C388)
//Script of Create New Definitions button
//Note: ALListFindDup also duplicates the records
$_t_DefinitionReference:=RemoveLeadTr(Uppers2(Gen_Request("Enter User initials for definitions:")))
If ((OK=1) & ($_t_DefinitionReference#""))
	If (Length:C16($_t_DefinitionReference)>7)
		Gen_Alert("NB: Only the first 7 characters specified will be used"; "OK")
		$_t_DefinitionReference:=Substring:C12($_t_DefinitionReference; 1; 7)
	End if 
	MESSAGES OFF:C175
	ORDER BY:C49([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Order:7; >)
	ARRAY TEXT:C222($_at_Identity; 0)
	ARRAY TEXT:C222($_at_Label; 0)
	
	ARRAY INTEGER:C220($_ai_Width; 0)
	ARRAY TEXT:C222($_at_Format; 0)
	ARRAY LONGINT:C221($_al_FieldOrder; 0)
	ARRAY BOOLEAN:C223($_abo_Enterable; 0)
	
	ARRAY BOOLEAN:C223($_abo_LockedColumn; 0)
	ARRAY TEXT:C222($_at_Formula; 0)
	
	ARRAY INTEGER:C220($_ai_FontSize; 0)
	ARRAY TEXT:C222($_at_ColumnColour; 0)
	ARRAY TEXT:C222($_at_Settings; 0)
	ARRAY INTEGER:C220($_ai_Footers; 0)
	
	ARRAY LONGINT:C221($_al_Table; 0)
	ARRAY LONGINT:C221($_al_Field; 0)
	
	SELECTION TO ARRAY:C260([LIST_LAYOUTS:96]Layout_Reference:1; $_at_Identity; [LIST_LAYOUTS:96]Table_Number:2; $_al_Table; [LIST_LAYOUTS:96]Field_Number:3; $_al_Field; [LIST_LAYOUTS:96]Title:4; $_at_Label; [LIST_LAYOUTS:96]Width:5; $_ai_Width; [LIST_LAYOUTS:96]Format:6; $_at_Format; [LIST_LAYOUTS:96]Order:7; $_al_FieldOrder; [LIST_LAYOUTS:96]Enterable:8; $_abo_Enterable; [LIST_LAYOUTS:96]Locked:10; $_abo_LockedColumn; [LIST_LAYOUTS:96]Formula:9; $_at_Formula; [LIST_LAYOUTS:96]Font_Size:11; $_ai_FontSize; [LIST_LAYOUTS:96]Colour:12; $_at_ColumnColour; [LIST_LAYOUTS:96]Settings:13; $_at_Settings; [LIST_LAYOUTS:96]Footer:14; $_ai_Footers; [LIST_LAYOUTS:96]X_Related_Field:16; $_al_RelatedField; [LIST_LAYOUTS:96]X_Related_Table:15; $_al_RelatedTable; [LIST_LAYOUTS:96]X_associatedArrayName:17; $_at_arrayName)
	MESSAGES ON:C181
	
	$_t_DefinitionReferenceFULL:=DB_t_CurrentFormUsage2+$_t_DefinitionReference
	QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$_t_DefinitionReferenceFULL)
	If (Records in selection:C76([LIST_LAYOUTS:96])>0)
		Gen_Alert("That Reference is not unique"; "Cancel")
	Else 
		DB_t_CurrentFormUsage3:=$_t_DefinitionReference
		$_l_SIzeOfArray:=Size of array:C274($_at_Identity)
		For ($_l_Index; 1; $_l_SIzeOfArray)
			$_at_Identity{$_l_Index}:=$_t_DefinitionReferenceFULL
			$_al_FieldOrder{$_l_Index}:=$_l_Index
		End for 
		ARRAY TO SELECTION:C261($_at_Identity; [LIST_LAYOUTS:96]Layout_Reference:1; $_al_Table; [LIST_LAYOUTS:96]Table_Number:2; $_al_Field; [LIST_LAYOUTS:96]Field_Number:3; $_at_Label; [LIST_LAYOUTS:96]Title:4; $_ai_Width; [LIST_LAYOUTS:96]Width:5; $_at_Format; [LIST_LAYOUTS:96]Format:6; $_al_FieldOrder; [LIST_LAYOUTS:96]Order:7; $_abo_Enterable; [LIST_LAYOUTS:96]Enterable:8; $_abo_LockedColumn; [LIST_LAYOUTS:96]Locked:10; $_at_Formula; [LIST_LAYOUTS:96]Formula:9; $_ai_FontSize; [LIST_LAYOUTS:96]Font_Size:11; $_at_ColumnColour; [LIST_LAYOUTS:96]Colour:12; $_at_Settings; [LIST_LAYOUTS:96]Settings:13; $_ai_Footers; [LIST_LAYOUTS:96]Footer:14; $_al_RelatedField; [LIST_LAYOUTS:96]X_Related_Field:16; $_al_RelatedTable; [LIST_LAYOUTS:96]X_Related_Table:15; $_at_arrayName; [LIST_LAYOUTS:96]X_associatedArrayName:17)
		
		//Add to the popup
		$_l_SIzeOfArray:=Size of array:C274(SVS_at_PreviewEvent)+1
		INSERT IN ARRAY:C227(SVS_at_PreviewEvent; $_l_SIzeOfArray; 1)
		SVS_at_PreviewEvent{$_l_SIzeOfArray}:=$_t_DefinitionReference
		SVS_at_PreviewEvent:=$_l_SIzeOfArray
		
		vNo:=Records in selection:C76([LIST_LAYOUTS:96])
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [LIST_LAYOUTS].Layouts_Out.Variable3"; $_t_oldMethodName)
