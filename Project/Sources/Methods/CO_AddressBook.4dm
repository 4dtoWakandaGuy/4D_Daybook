//%attributes = {}
If (False:C215)
	//Project Method Name:      CO_AddressBook
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  15/05/2010 10:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_OK)
	C_TEXT:C284($_t_oldMethodName; DOC_t_DocumentCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CO_AddressBook")

ORDER BY:C49([COMPANIES:2]Company_Code:1; >)

If (Not:C34(SR_ReportOK("CompAddr")))
	
	
	If (OK=1)
		$_l_OK:=PRINT_SetSIZE("A4"; "P"; "CompCont")
		If ($_l_OK>=0)
			If ($_l_OK=1)
				PRINT SETTINGS:C106
				$_l_OK:=OK
			Else 
				$_l_OK:=1
			End if 
		Else 
			$_l_OK:=0
		End if 
		If ($_l_OK=1)
			FIRST RECORD:C50([COMPANIES:2])
			DOC_t_DocumentCode:=Substring:C12([COMPANIES:2]Company_Code:1; 1; 1)
			If (DOC_t_DocumentCode<"A")
				DOC_t_DocumentCode:="A"
			End if 
			
			Print form:C5([COMPANIES:2]; "Comp_Cont_Hdr")
			While ((Not:C34(End selection:C36([COMPANIES:2]))) & (OK=1))
				If (DOC_t_DocumentCode<Substring:C12([COMPANIES:2]Company_Code:1; 1; 1))
					PAGE BREAK:C6
					DOC_t_DocumentCode:=Substring:C12([COMPANIES:2]Company_Code:1; 1; 1)
					Print form:C5([COMPANIES:2]; "Comp_Cont_Hdr")
				End if 
				Print form:C5([COMPANIES:2]; "Comp_Cont")
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=[COMPANIES:2]Company_Code:1)
				FIRST RECORD:C50([CONTACTS:1])
				While (Not:C34(End selection:C36([CONTACTS:1])))
					Print form:C5([CONTACTS:1]; "Cont_Cont")
					NEXT RECORD:C51([CONTACTS:1])
				End while 
				NEXT RECORD:C51([COMPANIES:2])
			End while 
			PAGE BREAK:C6
			
			PRT_SetPrinterPaperOptions("CompCont")  //NG June 2005
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("CO_AddressBook"; $_t_oldMethodName)