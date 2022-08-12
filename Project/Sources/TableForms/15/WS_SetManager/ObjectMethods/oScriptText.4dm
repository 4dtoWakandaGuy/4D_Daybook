If (False:C215)
	//object Name: [USER]WS_SetManager.Variable8
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CurrentCaseLevel; $_l_EndHighlight; $_l_ScriptLength; $_l_Spaces; $_l_StartHighlight; $CaseLevNow)
	C_POINTER:C301($_ptr_ScriptText)
	C_TEXT:C284($_t_Function; $_t_oldMethodName; SM_T_MacroText; vMT; vMTitle3)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].WS_SetManager.Variable8"; Form event code:C388)
//Record_Paginate
$_ptr_ScriptText:=->SM_T_MacroText
GET HIGHLIGHT:C209($_ptr_ScriptText->; $_l_StartHighlight; $_l_EndHighlight)
$_l_ScriptLength:=Length:C16($_ptr_ScriptText->)
$_l_EndHighlight:=$_l_EndHighlight-1
While ((Substring:C12($_ptr_ScriptText->; $_l_EndHighlight+1; 1)#Char:C90(13)) & ($_l_EndHighlight<$_l_ScriptLength))
	IDLE:C311  // 03/04/03 pb
	$_l_EndHighlight:=$_l_EndHighlight+1
End while 
$_ptr_ScriptText->:=Substring:C12($_ptr_ScriptText->; 1; $_l_EndHighlight)+Char:C90(9)+Substring:C12($_ptr_ScriptText->; $_l_EndHighlight+1; 32000)

vMT:=$_ptr_ScriptText->
$_l_Spaces:=0
$_ptr_ScriptText->:=""
While (Length:C16(vMT)>3)
	IDLE:C311  // 03/04/03 pb
	$_t_Function:=Record_PagLine
	If (Substring:C12($_t_Function; Length:C16($_t_Function); 1)=Char:C90(9))
		$_t_Function:=Substring:C12($_t_Function; 1; Length:C16($_t_Function)-1)
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
		: ($_t_Function=":")
			$_l_Spaces:=$_l_Spaces-2
		: ($_t_Function="Else")
			$_l_Spaces:=$_l_Spaces-2
		: ($_t_Function="End while")
			$_l_Spaces:=$_l_Spaces-3
		: ($_t_Function="Until")
			$_l_Spaces:=$_l_Spaces-3
		: ($_t_Function="End for")
			$_l_Spaces:=$_l_Spaces-3
		: ($_t_Function="End case")
			$_l_Spaces:=$_l_Spaces-4
		: ($_t_Function="End if")
			$_l_Spaces:=$_l_Spaces-2
	End case 
	$_ptr_ScriptText->:=$_ptr_ScriptText->+(" "*$_l_Spaces)+vMTitle3+Char:C90(13)
	Case of 
		: ($_t_Function="If")
			$_l_Spaces:=$_l_Spaces+2
		: ($_t_Function="Case of")
			$_l_Spaces:=$_l_Spaces+4
		: ($_t_Function=":")
			$_l_Spaces:=$_l_Spaces+2
		: ($_t_Function="While")
			$_l_Spaces:=$_l_Spaces+3
		: ($_t_Function="Repeat")
			$_l_Spaces:=$_l_Spaces+3
		: ($_t_Function="For")
			$_l_Spaces:=$_l_Spaces+3
		: ($_t_Function="Else")
			$_l_Spaces:=$_l_Spaces+2
	End case 
End while 

$_l_EndHighlight:=Position:C15(Char:C90(9); $_ptr_ScriptText->)
If ($_l_EndHighlight>0)
	$_ptr_ScriptText->:=Substring:C12($_ptr_ScriptText->; 1; $_l_EndHighlight-1)+Substring:C12($_ptr_ScriptText->; $_l_EndHighlight+1; 32000)
End if 
HIGHLIGHT TEXT:C210($_ptr_ScriptText->; $_l_EndHighlight; $_l_EndHighlight)
ERR_MethodTrackerReturn("OBJ [USER].WS_SetManager.Variable8"; $_t_oldMethodName)
