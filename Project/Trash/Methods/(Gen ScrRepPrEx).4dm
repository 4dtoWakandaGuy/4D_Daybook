//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen ScrRepPrEx
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:42If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(a01Real1)
	//C_UNKNOWN(a01Real2)
	//C_UNKNOWN(a01Real3)
	//C_UNKNOWN(a01Real4)
	//C_UNKNOWN(a01Real5)
	//C_UNKNOWN(a01Real6)
	//C_UNKNOWN(a01Stri1)
	//C_UNKNOWN(a01Stri2)
	C_BOOLEAN:C305($_bo_Continue)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_Index; $_l_OK; $_l_Page; $_l_PageCount; vNo)
	C_REAL:C285(vAmount; vDue; vInvoiced; vPaid; vSubtotal; vT1; vT2; vT3; vT4; vT5; vT6)
	C_REAL:C285(vVAT)
	C_TEXT:C284($_t_oldMethodName; $1; vCompCode; vCompName; vFld; vPPage; vRec; vtitle; vTitle1; vTitle2; vTitle3)
	C_TEXT:C284(vTitle4; vTitle5; vTitle6; vTitle7; vTitle8)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen ScrRepPrEx")

If ($1="Pr")
	//Gen_Confirm ("Please choose 100% Landscape Print Settings")
	$_l_OK:=PRINT_SetSIZE("A4"; "L"; vtitle)
	$_bo_Continue:=($_l_OK>=0)
Else 
	Gen_Confirm("Please name the Export file")
	$_bo_Continue:=(OK=1)
End if 
If (OK=1) & ($_bo_Continue)
	If ($1="Pr")
		// PRINT_SetSIZE ("A4";"L")
		// PAGE SETUP([INVOICES];"ScrRep Hdr")
		//   PRINT SETTINGS
	Else 
		SET CHANNEL:C77(12; "")
		vRec:=Char:C90(13)
		vFld:=Char:C90(9)
	End if 
	If (OK=1)
		vNo:=Size of array:C274(a01Stri1)
		$_l_PageCount:=1
		$_l_Page:=1
		
		For ($_l_Index; 1; vNo)
			If (($_l_PageCount>26) & ($1="Pr"))
				PAGE BREAK:C6
				$_l_PageCount:=1
			End if 
			If ($_l_PageCount=1)
				If ($1="Pr")
					vPPage:="Page "+String:C10($_l_Page)
					Print form:C5([INVOICES:39]; "ScrRep Hdr")
					$_l_Page:=$_l_Page+1
				Else 
					SEND PACKET:C103(vTitle+" "+String:C10(<>DB_d_CurrentDate)+vRec+vRec)
					SEND PACKET:C103(vTitle1+vFld+vTitle2+vFld+vTitle3+vFld+vTitle4+vFld+vTitle5+vFld+vTitle6+vFld+vTitle7+vFld+vTitle8+vRec+vRec)
				End if 
			End if 
			
			vCompCode:=a01Stri1{$_l_Index}
			vCompName:=a01Stri2{$_l_Index}
			vAmount:=a01Real1{$_l_Index}
			vPaid:=a01Real2{$_l_Index}
			vInvoiced:=a01Real3{$_l_Index}
			vDue:=a01Real4{$_l_Index}
			vSubtotal:=a01Real5{$_l_Index}
			vVAT:=a01Real6{$_l_Index}
			If ($1="Pr")
				Print form:C5([INVOICES:39]; "ScrRep Det")
			Else 
				SEND PACKET:C103(vCompCode+vFld+vCompName+vFld+String:C10(vAmount; "|Accounts")+vFld+String:C10(vPaid; "|Accounts")+vFld+String:C10(vInvoiced; "|Accounts")+vFld+String:C10(vDue; "|Accounts")+vFld+String:C10(vSubtotal; "|Accounts")+vFld+String:C10(vVAT; "|Accounts")+vRec)
			End if 
			$_l_PageCount:=$_l_PageCount+1
		End for 
		
		If ($1="Pr")
			Print form:C5([INVOICES:39]; "ScrRep Ftr")
			PAGE BREAK:C6
			PRT_SetPrinterPaperOptions(vtitle)
		Else 
			SEND PACKET:C103(vRec+String:C10(vNo)+vFld+vFld+String:C10(vT1; "|Accounts")+vFld+String:C10(vT2; "|Accounts")+vFld+String:C10(vT3; "|Accounts")+vFld+String:C10(vT4; "|Accounts")+vFld+String:C10(vT5; "|Accounts")+vFld+String:C10(vT6; "|Accounts")+vRec)
			SET CHANNEL:C77(11)
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("Gen ScrRepPrEx"; $_t_oldMethodName)