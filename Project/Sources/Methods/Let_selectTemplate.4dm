//%attributes = {}
If (False:C215)
	//Project Method Name:      Let_selectTemplate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/12/2009 08:34`Method: Let_selectTemplate
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DOC_al_TemplatesInclude;0)
	//ARRAY TEXT(WS_at_TemplateNames;0)
	//ARRAY TEXT(WS_at_TemplateRefs;0)
	C_BOOLEAN:C305(DOC_bo_AutoPrint; DOC_bo_TemplateSelected)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_WindowBottom; $_l_WindowCentreVertical; $_l_WindowLeft; $_l_WindowReference; $_l_WindowRight; $_l_WindowTop; $_l_WindowWidth; $4; $5; WIN_l_CurrentWinRef)
	C_LONGINT:C283(WIN_l_CurrentWinRefOLD; WS_l_TemplateMgrContext)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3; DOC_t_CanceTtext; DOC_t_PreviewText; DOC_t_useText; WS_t_TemplateType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Let_selectTemplate")
//this method assumes you have already found any templates!

WS_at_TemplateNames:=0
WS_at_TemplateRefs:=0
DOC_al_TemplatesInclude:=0
WS_t_TemplateType:="Word Processor Templates"
WS_l_TemplateMgrContext:=1
GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
$_l_WindowCentreVertical:=$_l_WindowLeft+($_l_WindowWidth/2)
DOC_bo_TemplateSelected:=False:C215
If (Count parameters:C259>=1)
	DOC_t_CanceTtext:=$1
Else 
	DOC_t_CanceTtext:="Cancel"
End if 
If (Count parameters:C259>=2)
	DOC_t_useText:=$2
Else 
	DOC_t_useText:="Use Template"
End if 
If (Count parameters:C259>=3)
	DOC_t_PreviewText:=$3
Else 
	DOC_t_PreviewText:=""
End if 

Case of 
	: (Count parameters:C259=4)
		If ($4>0)
			$_l_WindowReference:=Open window:C153($4; $_l_WindowTop+10; $4; $_l_WindowTop+10; -1990; "Select Template"; "WP_TemplatesClose")
		Else 
			$_l_WindowReference:=Open window:C153((440/2)-$_l_WindowCentreVertical; $_l_WindowTop+10; (440/2)-$_l_WindowCentreVertical; $_l_WindowTop+10; -1990; "Select Template"; "WP_TemplatesClose")
		End if 
	: (Count parameters:C259>=5)
		Case of 
			: ($4>0) & ($5=0)
				$_l_WindowReference:=Open window:C153($4; $_l_WindowTop+10; $4; $_l_WindowTop+10; -1990; "Select Template"; "WP_TemplatesClose")
			: ($4>0) & ($5>0)
				$_l_WindowReference:=Open window:C153($4; $5; $4; $5; -1990; "Select Template"; "WP_TemplatesClose")
				
			: ($4=0) & ($5>0)
				$_l_WindowReference:=Open window:C153((440/2)-$_l_WindowCentreVertical; $5; (440/2)-$_l_WindowCentreVertical; $5; -1990; "Select Template"; "WP_TemplatesClose")
			Else 
				$_l_WindowReference:=Open window:C153((440/2)-$_l_WindowCentreVertical; $_l_WindowTop+10; (440/2)-$_l_WindowCentreVertical; $_l_WindowTop+10; -1990; "Select Template"; "WP_TemplatesClose")
		End case 
	Else 
		$_l_WindowReference:=Open window:C153((440/2)-$_l_WindowCentreVertical; $_l_WindowTop+10; (440/2)-$_l_WindowCentreVertical; $_l_WindowTop+10; -1990; "Select Template"; "WP_TemplatesClose")
End case 
//Gen_Alert ("HELLO")
//DIALOG([USER];"DOC_TemplateSelector")
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=$_l_WindowReference
DIALOG:C40([USER:15]; "Template_Manager")
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
BRING TO FRONT:C326(Current process:C322)
ERR_MethodTrackerReturn("Let_selectTemplate"; $_t_oldMethodName)
