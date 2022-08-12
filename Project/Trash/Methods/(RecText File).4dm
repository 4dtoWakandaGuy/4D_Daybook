//%attributes = {"invisible":true}

If (False:C215)
	//Project Method Name:      RecText File
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	//ARRAY TEXT(<>SYS_at_2DFieldNames;0)
	//ARRAY TEXT(<>SYS_at_CurrentTableFieldNames;0)
	C_BOOLEAN:C305($_bo_Cut; $_bo_NoCr)
	C_LONGINT:C283($_l_EndHighlight; $_l_StartHighlight)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("RecText File")

//Method RectextFile

//Modified NG march 2004
//Was Cutting text off if no CR

$_t_oldMethodName:=ERR_MethodTracker("RecText File")
$_bo_NoCr:=False:C215
If (<>DB_at_TableNames>0)
	$_bo_Cut:=False:C215
	GET HIGHLIGHT:C209($1->; $_l_StartHighlight; $_l_EndHighlight)
	
	Case of 
		: ($_l_StartHighlight=$_l_EndHighlight)
			If ($_l_StartHighlight>0) & (Length:C16($1->)>0)
				If ($_l_EndHighlight>Length:C16($1->))  //| (True)
					
					//$_l_StartHighlight:=$_l_EndHighlight-1
					
				Else 
					
					$_bo_Cut:=True:C214
					$_bo_NoCr:=True:C214
					//$_l_StartHighlight:=$_l_EndHighlight-1
					
					
				End if 
			End if 
		Else 
			$_bo_Cut:=True:C214
	End case 
	
	If ($_bo_Cut)
		If (Not:C34($_bo_NoCr))
			If (Length:C16($1->)>=$_l_StartHighlight)
				$1->:=Substring:C12($1->; 0; $_l_StartHighlight-1)+"["+<>DB_at_TableNames{<>DB_at_TableNames}+"]"+Char:C90(13)+Substring:C12($1->; $_l_EndHighlight; 32000)
			Else 
				$1->:=Substring:C12($1->; 0; $_l_StartHighlight-1)+"["+<>DB_at_TableNames{<>DB_at_TableNames}+"]"+Char:C90(13)+Substring:C12($1->; $_l_EndHighlight; 32000)
			End if 
			$_l_EndHighlight:=$_l_StartHighlight+Length:C16("["+<>DB_at_TableNames{<>DB_at_TableNames}+"]")+1
		Else 
			If (Length:C16($1->)>=$_l_StartHighlight)
				$1->:=Substring:C12($1->; 0; $_l_StartHighlight-1)+"["+<>DB_at_TableNames{<>DB_at_TableNames}+"]"+Substring:C12($1->; $_l_EndHighlight; 32000)
			Else 
				$1->:=Substring:C12($1->; 0; $_l_StartHighlight-1)+"["+<>DB_at_TableNames{<>DB_at_TableNames}+"]"+Substring:C12($1->; $_l_EndHighlight; 32000)
			End if 
			$_l_EndHighlight:=$_l_StartHighlight+Length:C16("["+<>DB_at_TableNames{<>DB_at_TableNames}+"]")
		End if 
	Else 
		$1->:=Substring:C12($1->; 0; $_l_StartHighlight)+"["+<>DB_at_TableNames{<>DB_at_TableNames}+"]"+Substring:C12($1->; $_l_EndHighlight; 32000)
		$_l_EndHighlight:=$_l_StartHighlight+Length:C16("["+<>DB_at_TableNames{<>DB_at_TableNames}+"]")+2
	End if 
	
	
	HIGHLIGHT TEXT:C210($1->; $_l_StartHighlight; $_l_EndHighlight)
	COPY ARRAY:C226(<>SYS_at_2DFieldNames{<>DB_at_TableNames}; <>SYS_at_CurrentTableFieldNames)
	<>SYS_at_CurrentTableFieldNames:=1
Else 
	<>DB_at_TableNames:=1
End if 
ERR_MethodTrackerReturn("RecText File"; $_t_oldMethodName)
