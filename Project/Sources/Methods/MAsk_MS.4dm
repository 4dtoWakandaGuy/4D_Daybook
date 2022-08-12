//%attributes = {}
If (False:C215)
	//Project Method Name:      MAsk_MS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 22:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(ch5)
	//C_UNKNOWN(ch6)
	//C_UNKNOWN(ch7)
	//C_UNKNOWN(ch8)
	//C_UNKNOWN(MMLetterClass)
	//C_UNKNOWN(vArea)
	//C_UNKNOWN(vDiscountF)
	//C_UNKNOWN(vLocation)
	//C_UNKNOWN(vP)
	//C_UNKNOWN(vProdCode)
	//C_UNKNOWN(vProdName)
	//C_UNKNOWN(vSNo)
	//C_UNKNOWN(vTitle1)
	//C_UNKNOWN(vValueF)
	//C_UNKNOWN(vValueT)
	//C_UNKNOWN(vVAT)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305($_bo_Unload; WIN_bo_TrackerInited; $_bo_Unload; WIN_bo_TrackerInited)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_OK; $_l_WindowReferenceRow; ch5; ch6; ch7; ch8; MMLetterClass; vP; vSNo; WIN_l_CurrentWinRef)
	C_LONGINT:C283(<>SYS_l_CancelProcess; <>SYS_l_LoggedInaccount; $_l_OK; $_l_WindowReferenceRow; WIN_l_CurrentWinRef)
	C_POINTER:C301($1)
	C_REAL:C285(vDiscountF; vValueF; vValueT; vVAT; vSubtotal)
	C_TEXT:C284($_t_oldMethodName; $_t_SSC; vArea; vLocation; vProdCode; vProdName; vTitle1; $_t_oldMethodName; $_t_SSC)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MAsk_MS")
<>SYS_l_CancelProcess:=0
If (Not:C34((MMLetterClass=4D Write Email) | (MMLetterClass=4D Write Email Template) | (MMLetterClass=Text Email) | (MMLetterClass=Text Email Template)))
	
	If ((vP=1) & (ch5=1))
		
		READ ONLY:C145([USER:15])
		READ ONLY:C145([MAILSORT_B:78])
		If (Records in table:C83([MAILSORT_B:78])>500)
			$_bo_Unload:=(Records in selection:C76([USER:15])=0)
			If (<>SYS_l_LoggedInaccount=0)
				QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=0)
			Else 
				QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>SYS_l_LoggedInaccount)
			End if 
			If (Check_SSC([USER:15]Postcode:6; ->[USER:15]Town:4; ->vArea))
				$_t_SSC:=Substring:C12(vArea; 1; 3)
				QUERY:C277([MAILSORT_D6:82]; [MAILSORT_D6:82]Residue_Code:2=$_t_SSC)
				vArea:=[MAILSORT_D6:82]Area_Code:1
				vSNo:=((Character code:C91([MAILSORT_D6:82]Area_Code:1)-65)*2)+1
			Else 
				vArea:=""
				vSNo:=0
			End if 
			vDiscountF:=[USER:15]Mailsort Size:171
			vLocation:=""
			vValueF:=12
			vValueT:=30
			vProdCode:=[USER:15]Mailsort Serv:173
			If (vProdCode="")
				vProdCode:="MS:1 Mailsort 1"
			End if 
			vProdName:=""
			
			Open_AnyTypeWindow(258; 483; 5; "Mailsort Requirements")
			DIALOG:C40([DOCUMENTS:7]; "dAsk_MS")
			CLOSE WINDOW:C154
			If ($_bo_Unload)
				UNLOAD RECORD:C212([USER:15])
			End if 
			$_l_OK:=OK
			OK:=1
			If (WIN_bo_TrackerInited)
				$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
				If ($_l_WindowReferenceRow>0)
					WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
				End if 
			End if 
			If ($_l_OK=0)
				vP:=0
			Else 
				
				If ((ch6=0) | (vLocation=""))
					Mail_MSProcess($1)
				End if 
				
				If (<>SYS_l_CancelProcess#Current process:C322)
					If (ch7=1)
						Mail_MSShow
					End if 
					
					
					If (OK=1)
						
						If ((ch6=0) | (vLocation=""))
							Mail_MSPlanRep
						End if 
						
						MailP_Ready("Are you ready to print the Mailsort Line Listing?  (Settings 100% Portrait)")
						If (OK=1)
							
							QUERY:C277([MAILSORT_MAIL:83]; [MAILSORT_MAIL:83]Record_Number:1=999999; *)
							QUERY:C277([MAILSORT_MAIL:83];  & ; [MAILSORT_MAIL:83]SSC:3#"000@")
							Mail_MSSort
							Mail_MSStart
							vTitle1:="Volume: "+String:C10(Sum:C1([MAILSORT_MAIL:83]Count:5))
							vSubtotal:=0
							vVAT:=0
							
							FORM SET OUTPUT:C54([MAILSORT_MAIL:83]; "Line_Listing")
							PRINT SELECTION:C60([MAILSORT_MAIL:83])
						End if 
						
						OK:=1
					End if 
					
					If (<>SYS_l_CancelProcess#Current process:C322)
						QUERY:C277([MAILSORT_MAIL:83]; [MAILSORT_MAIL:83]Record_Number:1#999999)
						Mail_MSSort
						Mail_MSStart
					End if 
				Else 
					OK:=0
				End if 
				
			End if 
		Else 
			Gen_Alert("The Mailsort files have not been properly imported"; "No Mailsort")
			ch5:=0
			ch6:=0
			ch8:=0
		End if 
	Else 
		ch6:=0
		ch8:=0
	End if 
Else 
	OK:=1
End if 
ERR_MethodTrackerReturn("MAsk_MS"; $_t_oldMethodName)
