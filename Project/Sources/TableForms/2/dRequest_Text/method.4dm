If (False:C215)
	//Table Form Method Name: [COMPANIES]dRequest_Text
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/06/2013 15:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SCPT_bo_NoAutoScripts; DB_bo_NoLoad; TXT_bo_CheckBox)
	C_LONGINT:C283($_l_CharacterPosition; $_l_ConfirmBottom; $_l_CurrentHeight; $_l_event; $_l_HeightNeeded; $_l_LabelBottom; $_l_LabelLeft; $_l_LabelRight; $_l_LabelTop; $_l_MaxLineLength; $_l_NumberOfCarriageReturns)
	C_LONGINT:C283($_l_NumberOfSoftReturns; $_l_ObjectBottom; $_l_ObjectBottom2; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_ObjectTop2; $_l_TestIndex; $_l_WindowBottom; $_l_WindowHeight; $_l_WindowLeft)
	C_LONGINT:C283($_l_WindowRIght; $_l_WindowTop)
	C_TEXT:C284(<>ButtCanc; <>ButtOK; $_t_Confirm; $_t_oldMethodName; $_t_ThisLine; TXT_t_CHeckBoxMessage; vConfirm; Vt)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dRequest_Text"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
		//  : (Before)
		
	: ($_l_event=11)  // for debugging
		
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[COMPANIES:2]); "dRequest_Text")
		If (<>ButtOK#"")
			OBJECT SET TITLE:C194(xOK; <>ButtOK)
		End if 
		If (<>ButtCanc#"")
			OBJECT SET TITLE:C194(xCancel; <>ButtCanc)
		End if 
		If (<>SCPT_bo_NoAutoScripts=False:C215)
			PLAY:C290("Daybook Confirm"; 0)
		End if 
		$_l_NumberOfCarriageReturns:=STR_CountStr(Vt; Char:C90(13))
		$_l_NumberOfSoftReturns:=STR_CountStr(Vt; Char:C90(10))
		If (Length:C16(Vt)>100) | ($_l_NumberOfCarriageReturns>4) | (True:C214)
			$_l_MaxLineLength:=35
			If ($_l_NumberOfCarriageReturns>0)
				
				$_t_Confirm:=Vt
				For ($_l_TestIndex; 1; $_l_NumberOfCarriageReturns)
					
					$_l_CharacterPosition:=Position:C15(Char:C90(13); $_t_Confirm)
					If ($_l_CharacterPosition>0)
						$_t_ThisLine:=Substring:C12($_t_Confirm; 1; $_l_CharacterPosition-1)
						$_t_Confirm:=Substring:C12($_t_Confirm; $_l_CharacterPosition+1; Length:C16($_t_Confirm))
						
						Repeat 
							If (Length:C16($_t_ThisLine)>$_l_MaxLineLength)
								$_l_NumberOfCarriageReturns:=$_l_NumberOfCarriageReturns+1
								$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_MaxLineLength+1; Length:C16($_t_ThisLine))
							Else 
								$_t_ThisLine:=""
								
							End if 
							
						Until (Length:C16($_t_ThisLine)=0)
						
					End if 
				End for 
				If (Length:C16($_t_Confirm)>0)
					Repeat 
						If (Length:C16($_t_Confirm)>$_l_MaxLineLength)
							$_l_NumberOfCarriageReturns:=$_l_NumberOfCarriageReturns+1
							$_t_Confirm:=Substring:C12($_t_Confirm; $_l_MaxLineLength+1; Length:C16($_t_Confirm))
						Else 
							$_t_Confirm:=""
							
						End if 
						
					Until (Length:C16($_t_Confirm)=0)
					
				End if 
				
			Else 
				//no carriage returns
				$_l_NumberOfCarriageReturns:=Length:C16(Vt)/35
			End if 
			
			//SET VISIBLE(VtBigMessage;True)
			$_l_HeightNeeded:=($_l_NumberOfCarriageReturns*20)+12
			If ($_l_HeightNeeded<100)  //This height is for the object
				$_l_HeightNeeded:=100
			End if 
			OBJECT GET COORDINATES:C663(vConfirm; $_l_LabelLeft; $_l_LabelTop; $_l_LabelRight; $_l_LabelBottom)
			OBJECT GET COORDINATES:C663(Vt; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRIght; $_l_WindowBottom)
			$_l_CurrentHeight:=($_l_WindowBottom-$_l_WindowTop)-64
			If (($_l_WindowTop+($_l_CurrentHeight+$_l_HeightNeeded))>(Screen height:C188-20))
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop; $_l_WindowRIght; (Screen height:C188-20))
				$_l_WindowHeight:=(Screen height:C188-20)-$_l_WindowTop
				
			Else 
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop; $_l_WindowRIght; $_l_WindowTop+($_l_CurrentHeight+$_l_HeightNeeded))
				$_l_WindowHeight:=($_l_WindowTop+($_l_CurrentHeight+$_l_HeightNeeded))-$_l_WindowTop
				
			End if 
			$_l_ConfirmBottom:=$_l_WindowHeight-87
			OBJECT MOVE:C664(Vt; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_WindowHeight-38; *)
			
			$_l_ObjectBottom:=$_l_WindowHeight-38  //Gen_SetObjectPosition (->Vt;0;0;$_l_WindowHeight-38;;*)
			$_l_ObjectBottom2:=Gen_SetobjectPositionByname("oButton1"; $_l_ObjectBottom+5)
			$_l_ObjectBottom2:=Gen_SetobjectPositionByname("oButton2"; $_l_ObjectBottom+5)
			
		Else 
			
			
		End if 
		TXT_bo_CheckBox:=False:C215
		If (TXT_t_CHeckBoxMessage#"")
			OBJECT GET COORDINATES:C663(*; "obutton2"; $_l_ObjectLeft; $_l_ObjectTop2; $_l_ObjectRIght; $_l_ObjectBottom)
			// Modified by: Nigel Greenlee. (25/05/2013
			OBJECT GET COORDINATES:C663(vT; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRIght; $_l_ObjectBottom)
			OBJECT MOVE:C664(Vt; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRIght; $_l_ObjectTop2-26; *)
			$_l_ObjectBottom:=$_l_ObjectTop2-20
			OBJECT MOVE:C664(TXT_bo_CheckBox; $_l_ObjectLeft; $_l_ObjectBottom+4; $_l_ObjectRIght; $_l_ObjectBottom+19; *)
			OBJECT SET VISIBLE:C603(TXT_bo_CheckBox; True:C214)
			OBJECT SET TITLE:C194(TXT_bo_CheckBox; TXT_t_CHeckBoxMessage)
		Else 
			OBJECT SET VISIBLE:C603(TXT_bo_CheckBox; False:C215)
		End if 
		
		INT_SetDialog
		
	Else 
		
		// : (Deactivated)
		//PAUSE PROCESS(Current process)
		// : (Outside call)
		//  In_ButtdCall
End case 
ERR_MethodTrackerReturn("FM:dRequest_Text"; $_t_oldMethodName)
