//%attributes = {}

If (False:C215)
	//Project Method Name:      DIARY_in_SetObjectPositions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  22/01/2020
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ActionBestHeight; $_l_ActionBestWidth; $_l_AdesBottom; $_l_AdesLeft; $_l_AdesRight; $_l_AdesTop; $_l_ButtonBottom; $_l_ButtonLeft; $_l_ButtonRight; $_l_buttonTop; $_l_LabelBottom)
	C_LONGINT:C283($_l_LabelHeight; $_l_LabelLeft; $_l_LabelRight; $_l_LabelTop; $_l_NextLeft; $_l_NextObjectTop; $_l_OLBOttom; $_l_OLLeft; $_l_OLRight; $_l_OLTop; $_l_required)
	C_LONGINT:C283($_l_SetForPage; $_l_Space; $_l_TextBottom; $_l_TextLeft; $_l_TextRIght; $_l_TextTop; $_l_VertResize; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop)
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_Balance; $_t_oldMethodName; $2)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DIARY_in_SetObjectPositions")
If (Count parameters:C259>=1)
	$_l_SetForPage:=$1
	If (Count parameters:C259>=2)
		$_t_Balance:=$2
	End if 
Else 
	If (Form current page:K67:6=2) | ([DIARY:12]Done:14)
		$_l_SetForPage:=2
	Else 
		$_l_SetForPage:=1
	End if 
	
End if 
If (True:C214)
	If ($_l_SetForPage=2)  //this is. 'done' item
		OBJECT GET COORDINATES:C663(*; "oDescriptionLabel"; $_l_LabelLeft; $_l_LabelTop; $_l_LabelRight; $_l_LabelBottom)
		$_l_LabelHeight:=$_l_LabelBottom-$_l_LabelTop
		OBJECT GET BEST SIZE:C717(*; "oActionDetailsP2"; $_l_ActionBestWidth; $_l_ActionBestHeight)
		Case of 
			: ($_l_ActionBestHeight>100)
				$_l_ActionBestHeight:=100
			: ($_l_ActionBestHeight<37)
				$_l_ActionBestHeight:=37
		End case 
		If ($_t_Balance="Action")
			$_l_ActionBestHeight:=150
		End if 
		OBJECT GET COORDINATES:C663(*; "oActionDetailsP2"; $_l_AdesLeft; $_l_AdesTop; $_l_AdesRight; $_l_AdesBottom)
		OBJECT SET COORDINATES:C1248(*; "oActionDetailsP2"; $_l_AdesLeft; $_l_AdesTop; $_l_AdesRight; $_l_AdesTop+$_l_ActionBestHeight)
		$_l_NextObjectTop:=($_l_AdesTop+$_l_ActionBestHeight)+10
		
		If ([DIARY:12]Public:44)
			OBJECT SET VISIBLE:C603(*; "oPublicLabel"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oPublicField"; True:C214)
			OBJECT SET COORDINATES:C1248(*; "oPublicLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
			OBJECT SET COORDINATES:C1248(*; "oPublicField"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesLeft+12; $_l_NextObjectTop+12)
			$_l_NextObjectTop:=($_l_NextObjectTop+12)+10
			
		Else 
			OBJECT SET VISIBLE:C603(*; "oPublicLabel"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oPublicField"; False:C215)
		End if 
		If ([DIARY:12]Document_Code:15#"")
			OBJECT SET VISIBLE:C603(*; "oDocumentLabel"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oDocumentCodeField"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oDocumentTitleField"; True:C214)
			OBJECT SET COORDINATES:C1248(*; "oDocumentLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
			OBJECT SET COORDINATES:C1248(*; "oDocumentCodeField"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesLeft+133; $_l_NextObjectTop+14)
			OBJECT SET COORDINATES:C1248(*; "oDocumentTitleField"; ($_l_AdesLeft+133+5); $_l_NextObjectTop; $_l_AdesRight)
			$_l_NextObjectTop:=($_l_NextObjectTop+14)+10
		Else 
			OBJECT SET VISIBLE:C603(*; "oDocumentLabel"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oDocumentCodeField"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oDocumentTitleField"; False:C215)
		End if 
		If ([DIARY:12]Script_Code:29#"")
			OBJECT SET VISIBLE:C603(*; "oscriptLinkButton"; True:C214)
			
			OBJECT SET VISIBLE:C603(*; "oscriptLabel"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oScriptCodeField"; True:C214)
			OBJECT SET COORDINATES:C1248(*; "oscriptLinkButton"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
			
			OBJECT SET COORDINATES:C1248(*; "oscriptLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
			OBJECT SET COORDINATES:C1248(*; "oScriptCodeField"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesLeft+133; $_l_NextObjectTop+14)
			$_l_NextObjectTop:=($_l_NextObjectTop+14)+10
		Else 
			OBJECT SET VISIBLE:C603(*; "oscriptLinkButton"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oscriptLabel"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oScriptCodeField"; False:C215)
		End if 
		OBJECT GET COORDINATES:C663(*; "oOutcomeLabel"; $_l_OLLeft; $_l_OLTop; $_l_OLRight; $_l_OLBOttom)
		//TRACE
		OBJECT SET COORDINATES:C1248(*; "oOutcomeLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
		OBJECT SET COORDINATES:C1248(*; "oOutcomeFIeld"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesLeft+133; $_l_NextObjectTop+14)
		OBJECT SET COORDINATES:C1248(*; "oOutcomeTitle"; ($_l_AdesLeft+133+5); $_l_NextObjectTop; $_l_AdesRight)
		$_l_NextObjectTop:=($_l_NextObjectTop+14)+10
		
		
		//Available Space for Result
		$_l_required:=0
		If ([DIARY:12]Units:20>0) | ([DIARY:12]Value:16>0)
			$_l_required:=14+10
			
		End if 
		If ([DIARY:12]Job_Code:19#"") | ([DIARY:12]Stage_Code:21#"")
			$_l_required:=$_l_required+14+10
		End if 
		If ([DIARY:12]Order_Code:26#"")
			$_l_required:=$_l_required+14+10
		End if 
		If ([DIARY:12]Call_Code:25#"")
			$_l_required:=$_l_required+14+10
		End if 
		If ([DIARY:12]Product_Code:13#"")
			$_l_required:=$_l_required+14+10
		End if 
		OBJECT GET COORDINATES:C663(*; "Invisible Button4"; $_l_ButtonLeft; $_l_buttonTop; $_l_ButtonRight; $_l_ButtonBottom)
		$_l_Space:=($_l_buttonTop-$_l_NextObjectTop)-$_l_required
		Case of 
			: ($_l_Space<37)
				$_l_Space:=37
		End case 
		OBJECT GET COORDINATES:C663(*; "oResultDescriptionP2"; $_l_TextLeft; $_l_TextTop; $_l_TextRIght; $_l_TextBottom)
		OBJECT GET BEST SIZE:C717(*; "oResultDescriptionP2"; $_l_ActionBestWidth; $_l_ActionBestHeight)
		Case of 
			: ($_l_ActionBestHeight>$_l_Space)
				$_l_ActionBestHeight:=$_l_Space
			: ($_l_ActionBestHeight<$_l_Space)
				$_l_ActionBestHeight:=$_l_Space
			Else 
				$_l_ActionBestHeight:=$_l_Space
		End case 
		If ($_t_Balance="Action")
			$_l_ActionBestHeight:=50
		End if 
		
		OBJECT SET COORDINATES:C1248(*; "oDescriptionLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
		OBJECT SET COORDINATES:C1248(*; "oResultDescriptionP2"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesRight; $_l_NextObjectTop+$_l_ActionBestHeight)
		$_l_NextObjectTop:=($_l_NextObjectTop+$_l_ActionBestHeight)+10
		If ([DIARY:12]Units:20>0)
			OBJECT SET VISIBLE:C603(*; "oTimeUnitsLabel"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oTimeUnitsFIeld"; True:C214)
			OBJECT SET COORDINATES:C1248(*; "oTimeUnitsLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
			OBJECT SET COORDINATES:C1248(*; "oTimeUnitsFIeld"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesLeft+100; $_l_NextObjectTop+14)
			If ([DIARY:12]Value:16>0)
				$_l_NextLeft:=($_l_AdesLeft+100)+5
				OBJECT SET VISIBLE:C603(*; "oValueLabel"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oDiaryValueField"; False:C215)
				OBJECT SET COORDINATES:C1248(*; "oValueLabel"; $_l_NextLeft; $_l_NextObjectTop; $_l_NextLeft+$_l_LabelRight-2; $_l_NextObjectTop+$_l_LabelHeight)
				$_l_NextLeft:=$_l_NextLeft+$_l_LabelRight-2+5
				OBJECT SET COORDINATES:C1248(*; "oDiaryValueField"; $_l_NextLeft; $_l_NextObjectTop; $_l_NextLeft+100; $_l_NextObjectTop+14)
				
			Else 
				OBJECT SET VISIBLE:C603(*; "oValueLabel"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oDiaryValueField"; False:C215)
				
			End if 
			$_l_NextObjectTop:=($_l_NextObjectTop+14)+10
			
		Else 
			OBJECT SET VISIBLE:C603(*; "oTimeUnitsLabel"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oTimeUnitsFIeld"; False:C215)
			If ([DIARY:12]Value:16>0)
				OBJECT SET VISIBLE:C603(*; "oValueLabel"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oDiaryValueField"; True:C214)
				OBJECT SET COORDINATES:C1248(*; "oValueLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
				OBJECT SET COORDINATES:C1248(*; "oDiaryValueField"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesLeft+100; $_l_NextObjectTop+14)
				$_l_NextObjectTop:=($_l_NextObjectTop+14)+10
				
			Else 
				OBJECT SET VISIBLE:C603(*; "oValueLabel"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oDiaryValueField"; False:C215)
				
			End if 
			
		End if 
		If ([DIARY:12]Job_Code:19#"")
			OBJECT SET VISIBLE:C603(*; "oJobStageLabel"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oJobCodeField"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oJobStageField"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oJobStageName"; True:C214)
			OBJECT SET COORDINATES:C1248(*; "oJobStageLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
			OBJECT SET COORDINATES:C1248(*; "oJobStageField"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesLeft+100; $_l_NextObjectTop+14)
			OBJECT SET COORDINATES:C1248(*; "oJobStageField"; $_l_AdesLeft+100+5; $_l_NextObjectTop; $_l_AdesLeft+100+5+100; $_l_NextObjectTop+14)
			OBJECT SET COORDINATES:C1248(*; "oJobStageName"; ($_l_AdesLeft+100+5); $_l_NextObjectTop; $_l_AdesRight)
			$_l_NextObjectTop:=($_l_NextObjectTop+14)+10
			
			
		Else 
			OBJECT SET VISIBLE:C603(*; "oJobStageLabel"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oJobCodeField"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oJobStageField"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oJobStageName"; False:C215)
			
			
		End if 
		If ([DIARY:12]Order_Code:26#"")
			OBJECT SET VISIBLE:C603(*; "oOrderCodeLabel"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oOrderCodeField"; True:C214)
			OBJECT SET COORDINATES:C1248(*; "oOrderCodeLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
			OBJECT SET COORDINATES:C1248(*; "oOrderCodeField"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesLeft+100; $_l_NextObjectTop+14)
			$_l_NextObjectTop:=($_l_NextObjectTop+14)+10
		Else 
			OBJECT SET VISIBLE:C603(*; "oOrderCodeLabel"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oOrderCodeField"; False:C215)
			
		End if 
		If ([DIARY:12]Product_Code:13#"")
			OBJECT SET VISIBLE:C603(*; "oProductCodeLabel"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oProductCodeField"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oProductName"; True:C214)
			OBJECT SET COORDINATES:C1248(*; "oProductCodeLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
			OBJECT SET COORDINATES:C1248(*; "oProductCodeField"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesLeft+100; $_l_NextObjectTop+14)
			OBJECT SET COORDINATES:C1248(*; "oProductName"; $_l_AdesLeft+100; $_l_NextObjectTop; $_l_AdesRight; $_l_NextObjectTop+14)
			
			$_l_NextObjectTop:=($_l_NextObjectTop+14)+10
		Else 
			OBJECT SET VISIBLE:C603(*; "oProductCodeLabel"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oProductCodeField"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oProductName"; True:C214)
		End if 
		If ([DIARY:12]Call_Code:25#"")
			OBJECT SET VISIBLE:C603(*; "oServiceCodeLabel"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oServiceCodeField"; True:C214)
			OBJECT SET COORDINATES:C1248(*; "oProductCodeLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
			OBJECT SET COORDINATES:C1248(*; "oProductCodeField"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesLeft+100; $_l_NextObjectTop+14)
			
		Else 
			OBJECT SET VISIBLE:C603(*; "oServiceCodeLabel"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oServiceCodeField"; False:C215)
			
		End if 
	Else 
		
		OBJECT GET COORDINATES:C663(*; "oDescriptionLabel"; $_l_LabelLeft; $_l_LabelTop; $_l_LabelRight; $_l_LabelBottom)
		$_l_LabelHeight:=$_l_LabelBottom-$_l_LabelTop
		OBJECT GET BEST SIZE:C717(*; "oActionDetailsP1"; $_l_ActionBestWidth; $_l_ActionBestHeight)
		Case of 
			: ($_l_ActionBestHeight>200)
				$_l_ActionBestHeight:=200
			: ($_l_ActionBestHeight<200)
				$_l_ActionBestHeight:=200
		End case 
		If ($_t_Balance="Result")
			$_l_ActionBestHeight:=50
		End if 
		
		OBJECT GET COORDINATES:C663(*; "oActionDetailsP1"; $_l_AdesLeft; $_l_AdesTop; $_l_AdesRight; $_l_AdesBottom)
		OBJECT SET COORDINATES:C1248(*; "oActionDetailsP1"; $_l_AdesLeft; $_l_AdesTop; $_l_AdesRight; $_l_AdesTop+$_l_ActionBestHeight)
		$_l_NextObjectTop:=($_l_AdesTop+$_l_ActionBestHeight)+10
		////
		OBJECT SET VISIBLE:C603(*; "oPublicLabel"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oPublicField"; True:C214)
		OBJECT SET COORDINATES:C1248(*; "oPublicLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
		OBJECT SET COORDINATES:C1248(*; "oPublicField"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesLeft+12; $_l_NextObjectTop+12)
		$_l_NextObjectTop:=($_l_NextObjectTop+12)+10
		///
		OBJECT SET VISIBLE:C603(*; "oDocumentLabel"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oDocumentCodeField"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oDocumentTitleField"; True:C214)
		OBJECT SET COORDINATES:C1248(*; "oDocumentLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
		OBJECT SET COORDINATES:C1248(*; "oDocumentCodeField"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesLeft+133; $_l_NextObjectTop+14)
		OBJECT SET COORDINATES:C1248(*; "oDocumentTitleField"; ($_l_AdesLeft+133+5); $_l_NextObjectTop; $_l_AdesRight)
		$_l_NextObjectTop:=($_l_NextObjectTop+14)+10
		OBJECT SET VISIBLE:C603(*; "oscriptLinkButton"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oscriptLabel"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oScriptCodeField"; True:C214)
		OBJECT SET COORDINATES:C1248(*; "oscriptLinkButton"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
		OBJECT SET COORDINATES:C1248(*; "oscriptLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
		OBJECT SET COORDINATES:C1248(*; "oScriptCodeField"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesLeft+133; $_l_NextObjectTop+14)
		$_l_NextObjectTop:=($_l_NextObjectTop+14)+10
		OBJECT SET VISIBLE:C603(*; "oOutcomeTitle"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oOutcomeLabel"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oOutcomeFIeld"; True:C214)
		OBJECT GET COORDINATES:C663(*; "oOutcomeLabel"; $_l_OLLeft; $_l_OLTop; $_l_OLRight; $_l_OLBOttom)
		TRACE:C157
		OBJECT SET COORDINATES:C1248(*; "oOutcomeLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
		OBJECT SET COORDINATES:C1248(*; "oOutcomeFIeld"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesLeft+133; $_l_NextObjectTop+14)
		$_l_NextObjectTop:=($_l_NextObjectTop+14)+10
		$_l_required:=(14+10)*5
		
		OBJECT GET COORDINATES:C663(*; "Invisible Button4"; $_l_ButtonLeft; $_l_buttonTop; $_l_ButtonRight; $_l_ButtonBottom)
		$_l_Space:=($_l_buttonTop-$_l_NextObjectTop)-$_l_required
		Case of 
			: ($_l_Space<100)
				$_l_Space:=100
		End case 
		OBJECT GET COORDINATES:C663(*; "oResultDescriptionP1"; $_l_TextLeft; $_l_TextTop; $_l_TextRIght; $_l_TextBottom)
		OBJECT GET BEST SIZE:C717(*; "oResultDescriptionP1"; $_l_ActionBestWidth; $_l_ActionBestHeight)
		Case of 
			: ($_l_ActionBestHeight>$_l_Space)
				$_l_ActionBestHeight:=$_l_Space
			: ($_l_ActionBestHeight<100)
				$_l_ActionBestHeight:=100
			Else 
				$_l_ActionBestHeight:=$_l_Space
		End case 
		If ($_t_Balance="Action")
			$_l_ActionBestHeight:=50
		End if 
		OBJECT SET COORDINATES:C1248(*; "oDescriptionLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
		OBJECT SET COORDINATES:C1248(*; "oResultDescriptionP1"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesRight; $_l_NextObjectTop+$_l_ActionBestHeight)
		$_l_NextObjectTop:=($_l_NextObjectTop+$_l_ActionBestHeight)+10
		If (DB_GetModuleSettingByNUM(Module_JobCosting)>=2)
			
			OBJECT SET VISIBLE:C603(*; "oTimeUnitsLabel"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oTimeUnitsFIeld"; True:C214)
			OBJECT SET COORDINATES:C1248(*; "oTimeUnitsLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
			OBJECT SET COORDINATES:C1248(*; "oTimeUnitsFIeld"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesLeft+100; $_l_NextObjectTop+14)
			If ([DIARY:12]Value:16>0)
				$_l_NextLeft:=($_l_AdesLeft+100)+5
				OBJECT SET VISIBLE:C603(*; "oValueLabel"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oDiaryValueField"; True:C214)
				OBJECT SET COORDINATES:C1248(*; "oValueLabel"; $_l_NextLeft; $_l_NextObjectTop; $_l_NextLeft+$_l_LabelRight-2; $_l_NextObjectTop+$_l_LabelHeight)
				$_l_NextLeft:=$_l_NextLeft+$_l_LabelRight-2+5
				OBJECT SET COORDINATES:C1248(*; "oDiaryValueField"; $_l_NextLeft; $_l_NextObjectTop; $_l_NextLeft+100; $_l_NextObjectTop+14)
				
			Else 
				OBJECT SET VISIBLE:C603(*; "oValueLabel"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oDiaryValueField"; False:C215)
				
			End if 
			$_l_NextObjectTop:=($_l_NextObjectTop+14)+10
			
		Else 
			OBJECT SET VISIBLE:C603(*; "oTimeUnitsLabel"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oTimeUnitsFIeld"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oValueLabel"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oDiaryValueField"; False:C215)
			
			
			
		End if 
		If (DB_GetModuleSettingByNUM(Module_JobCosting)>=2)
			OBJECT SET VISIBLE:C603(*; "oJobStageLabel"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oJobCodeField"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oJobStageField"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oJobStageName"; True:C214)
			OBJECT SET COORDINATES:C1248(*; "oJobStageLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
			OBJECT SET COORDINATES:C1248(*; "oJobStageField"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesLeft+100; $_l_NextObjectTop+14)
			OBJECT SET COORDINATES:C1248(*; "oJobStageField"; $_l_AdesLeft+100+5; $_l_NextObjectTop; $_l_AdesLeft+100+5+100; $_l_NextObjectTop+14)
			OBJECT SET COORDINATES:C1248(*; "oJobStageName"; ($_l_AdesLeft+100+5); $_l_NextObjectTop; $_l_AdesRight)
			$_l_NextObjectTop:=($_l_NextObjectTop+14)+10
			
		Else 
			OBJECT SET VISIBLE:C603(*; "oJobStageLabel"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oJobCodeField"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oJobStageField"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oJobStageName"; False:C215)
			
			
		End if 
		If (DB_GetModuleSettingByNUM(Module_SalesOrders)>=2)
			OBJECT SET VISIBLE:C603(*; "oOrderCodeLabel"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oOrderCodeField"; True:C214)
			OBJECT SET COORDINATES:C1248(*; "oOrderCodeLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
			OBJECT SET COORDINATES:C1248(*; "oOrderCodeField"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesLeft+100; $_l_NextObjectTop+14)
			$_l_NextObjectTop:=($_l_NextObjectTop+14)+10
		Else 
			OBJECT SET VISIBLE:C603(*; "oOrderCodeLabel"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oOrderCodeField"; False:C215)
			
		End if 
		If (DB_GetModuleSettingByNUM(Module_Products)>=2)
			OBJECT SET VISIBLE:C603(*; "oProductCodeLabel"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oProductCodeField"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oProductName"; True:C214)
			OBJECT SET COORDINATES:C1248(*; "oProductCodeLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
			OBJECT SET COORDINATES:C1248(*; "oProductCodeField"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesLeft+100; $_l_NextObjectTop+14)
			OBJECT SET COORDINATES:C1248(*; "oProductName"; $_l_AdesLeft+100; $_l_NextObjectTop; $_l_AdesRight; $_l_NextObjectTop+14)
			
			$_l_NextObjectTop:=($_l_NextObjectTop+14)+10
		Else 
			OBJECT SET VISIBLE:C603(*; "oProductCodeLabel"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oProductCodeField"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oProductName"; False:C215)
		End if 
		If (DB_GetModuleSettingByNUM(Module_ServiceCentre)>=2)
			OBJECT SET VISIBLE:C603(*; "oServiceCodeLabel"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oServiceCodeField"; True:C214)
			OBJECT SET COORDINATES:C1248(*; "oProductCodeLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
			OBJECT SET COORDINATES:C1248(*; "oProductCodeField"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesLeft+100; $_l_NextObjectTop+14)
			$_l_NextObjectTop:=($_l_NextObjectTop+14)+10
		Else 
			OBJECT SET VISIBLE:C603(*; "oServiceCodeLabel"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oServiceCodeField"; False:C215)
			
		End if 
		If ($_l_NextObjectTop<($_l_buttonTop-50))
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			$_l_VertResize:=$_l_WindowBottom-($_l_NextObjectTop+40)
			//RESIZE FORM WINDOW(0;-$_l_VertResize)
		End if 
		
		
	End if 
End if 
ERR_MethodTrackerReturn("DIARY_in_SetObjectPositions"; $_t_oldMethodName)