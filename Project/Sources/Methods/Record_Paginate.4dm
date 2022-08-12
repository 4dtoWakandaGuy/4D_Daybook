//%attributes = {}
If (False:C215)
	//Project Method Name:      Record_Paginate
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
	C_LONGINT:C283($_l_CaseLevelNow; $_l_CurrentCaseLevel; $_l_EndHighlight; $_l_Length; $_l_Spaces; $_l_StartHighlight)
	C_POINTER:C301($_ptr_FocusObject)
	C_TEXT:C284($_t_oldMethodName; $_t_PageLine; vMT; vMTitle3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Record_Paginate")
//Record_Paginate
Menu_Record("Record_Paginate"; "Calculate Indents")
$_ptr_FocusObject:=Focus object:C278
If (Type:C295($_ptr_FocusObject->)=2)
	GET HIGHLIGHT:C209($_ptr_FocusObject->; $_l_StartHighlight; $_l_EndHighlight)
	$_l_Length:=Length:C16($_ptr_FocusObject->)
	$_l_EndHighlight:=$_l_EndHighlight-1
	While ((Substring:C12($_ptr_FocusObject->; $_l_EndHighlight+1; 1)#Char:C90(13)) & ($_l_EndHighlight<$_l_Length))
		IDLE:C311  // 7/04/03 pb
		$_l_EndHighlight:=$_l_EndHighlight+1
	End while 
	$_ptr_FocusObject->:=Substring:C12($_ptr_FocusObject->; 1; $_l_EndHighlight)+Char:C90(9)+Substring:C12($_ptr_FocusObject->; $_l_EndHighlight+1; 32000)
	
	vMT:=$_ptr_FocusObject->
	$_l_Spaces:=0
	$_ptr_FocusObject->:=""
	While (Length:C16(vMT)>3)
		IDLE:C311  // 7/04/03 pb
		$_t_PageLine:=Record_PagLine
		If (Substring:C12($_t_PageLine; Length:C16($_t_PageLine); 1)=Char:C90(9))
			$_t_PageLine:=Substring:C12($_t_PageLine; 1; Length:C16($_t_PageLine)-1)
		End if 
		If (vMTitle3#"     `@")
			RemoveLeadTr(vMTitle3; ->vMTitle3)
			If (vMTitle3="*@")
				vMTitle3:="     "+vMTitle3
			Else 
				If (vMTitle3#"@:=@")
					If ((vMTitle3="IMA @") | (vMTitle3="IME @") | (vMTitle3="ITX @"))
						vMTitle3:=Uppercase:C13(Substring:C12(vMTitle3; 1; 5))+Substring:C12(vMTitle3; 6; 32000)
					Else 
						vMTitle3:=Uppercase:C13(Substring:C12(vMTitle3; 1; 1))+Substring:C12(vMTitle3; 2; 32000)
					End if 
				End if 
			End if 
		End if 
		Case of 
			: ($_t_PageLine=":")
				$_l_Spaces:=$_l_Spaces-2
			: ($_t_PageLine="Else")
				$_l_Spaces:=$_l_Spaces-2
			: ($_t_PageLine="End while")
				$_l_Spaces:=$_l_Spaces-3
			: ($_t_PageLine="Until")
				$_l_Spaces:=$_l_Spaces-3
			: ($_t_PageLine="End for")
				$_l_Spaces:=$_l_Spaces-3
			: ($_t_PageLine="End case")
				$_l_Spaces:=$_l_Spaces-4
			: ($_t_PageLine="End if")
				$_l_Spaces:=$_l_Spaces-2
		End case 
		$_ptr_FocusObject->:=$_ptr_FocusObject->+(" "*$_l_Spaces)+vMTitle3+Char:C90(13)
		Case of 
			: ($_t_PageLine="If")
				$_l_Spaces:=$_l_Spaces+2
			: ($_t_PageLine="Case of")
				$_l_Spaces:=$_l_Spaces+4
			: ($_t_PageLine=":")
				$_l_Spaces:=$_l_Spaces+2
			: ($_t_PageLine="While")
				$_l_Spaces:=$_l_Spaces+3
			: ($_t_PageLine="Repeat")
				$_l_Spaces:=$_l_Spaces+3
			: ($_t_PageLine="For")
				$_l_Spaces:=$_l_Spaces+3
			: ($_t_PageLine="Else")
				$_l_Spaces:=$_l_Spaces+2
		End case 
	End while 
	
	$_l_EndHighlight:=Position:C15(Char:C90(9); $_ptr_FocusObject->)
	If ($_l_EndHighlight>0)
		$_ptr_FocusObject->:=Substring:C12($_ptr_FocusObject->; 1; $_l_EndHighlight-1)+Substring:C12($_ptr_FocusObject->; $_l_EndHighlight+1; 32000)
	End if 
	HIGHLIGHT TEXT:C210($_ptr_FocusObject->; $_l_EndHighlight; $_l_EndHighlight)
Else 
	Gen_Alert("This Function can only be used for Text fields"; "")
End if 
ERR_MethodTrackerReturn("Record_Paginate"; $_t_oldMethodName)
