//%attributes = {}
If (False:C215)
	//Project Method Name:      CO_News
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: CO_News
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_SearchTable; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; $2; $3; $5; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_ConstructURL; $_t_ConstructURL2; $_t_EventMethod; $_t_oldMethodName; $_t_SourceObjectIdentity; $1; $4; COM_T_DataString)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CO_News")

If (Count parameters:C259>=5)
	$_l_SearchTable:=$5
Else 
	$_l_SearchTable:=Table:C252(->[COMPANIES:2])
End if 
If (Count parameters:C259>=3)
	If (Count parameters:C259>3)
		$_t_ConstructURL:=$4
		$_t_ConstructURL:=CO_NewsApplyTokens($_t_ConstructURL; $_l_SearchTable)
		COM_T_DataString:=$_t_ConstructURL
	Else 
		$_t_SourceObjectIdentity:=$1  //the company product etc name
		$_t_SourceObjectIdentity:=Replace string:C233($_t_SourceObjectIdentity; " "; "+")
		//other replacements here
		
		$_t_ConstructURL:="http://www.google.co.uk/search?num=100&hl=en&safe=active&q=%22"+$_t_SourceObjectIdentity+"%22&btnG=Search&meta=cr%3DcountryUK%7CcountryGB"
		$_t_SourceObjectIdentity:="Workstation"
		$_t_ConstructURL2:=" & as_oq= & as_eq= & as_drrb=q & as_qdr= & as_mind=28"+" & as_minm=5 & as_maxd=27 & as_maxm=6 & as_nsrc= & as_nloc=UK & as_occt=any"
		
		COM_T_DataString:=$_t_ConstructURL
	End if 
	If (COM_T_DataString#"")
		//COM_T_DataString:="www.google.com"
		$_l_WindowBottom:=Screen height:C188-40
		$_l_WindowTop:=$3
		If ($_l_WindowBottom<$3)
			$_l_WindowBottom:=Screen height:C188-5
			$_l_WindowTop:=$_l_WindowBottom-400
		Else 
			If ($_l_WindowBottom>($3+400))
				$_l_WindowBottom:=Screen height:C188-5
			End if 
		End if 
		$_l_WindowRight:=Screen width:C187-20
		$_l_WindowLeft:=$2
		If ($_l_WindowRight<$2)
			$_l_WindowRight:=Screen width:C187
			$_l_WindowLeft:=Screen width:C187-400
		Else 
			If ($_l_WindowRight>($2+400))
				$_l_WindowRight:=Screen width:C187-100
			End if 
		End if 
		$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
		WIN_l_CurrentWinRef:=Open window:C153($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom; 4096; "Search Results"; "CO_CloseNews")
		$_t_EventMethod:=Method called on event:C705
		ON EVENT CALL:C190("")
		FORM SET INPUT:C55([USER:15]; "COM_News")
		
		
		ADD RECORD:C56([USER:15])
		CLOSE WINDOW:C154
		If ($_t_EventMethod#"")
			ON EVENT CALL:C190($_t_EventMethod)
		End if 
		WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	End if 
	
End if 
ERR_MethodTrackerReturn("CO_News"; $_t_oldMethodName)