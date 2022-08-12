//%attributes = {}
If (False:C215)
	//Project Method Name:      COM_CompanyFindDuplicates
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   17/09/2010 18:37
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_WindowBottom; $_l_WindowLeft; $_l_WindowReferenceRow; $_l_WindowRight; $_l_windowTop; ch1; ch2; ch3; ch4; ch5; ch6)
	C_LONGINT:C283(DB_l_CurrentDisplayedForm; DB_l_MaxRecords; vNo; vNo1; vNo2; vNo3; vNo4; vNo5; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_AddressLine1; $_t_AddressPostcode; $_t_AddressTelephone; $_t_AddressTown; $_t_CompanyName; $_t_oldMethodName; DB_t_CurrentContext)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("COM_CompanyFindDuplicates")
If (Count parameters:C259=0)
	CREATE SET:C116([COMPANIES:2]; "$Temp")
	
	If (Records in set:C195("ListboxSet0")>0)
		USE SET:C118("ListboxSet0")
	End if 
Else 
	//use the current selection
End if 
If (Records in selection:C76([COMPANIES:2])=1)
	Gen_Alert("You must select more then one company to compare")
End if 
If (Records in selection:C76([COMPANIES:2])>1)
	vNo1:=10
	vNo2:=10
	vNo3:=10
	vNo4:=4
	vNo5:=4
	Open_Any_Window(222; 370; 5; "Duplication Options")
	DIALOG:C40([COMPANIES:2]; "dComp_Dedup")
	CLOSE WINDOW:C154
	If (WIN_bo_TrackerInited)
		$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
		If ($_l_WindowReferenceRow>0)
			WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
		End if 
	End if 
	Are_You_Sure
	If (OK=1)
		Comp_DedupSort
		If (OK=1)
			Open_Pro_Window("Duplicatation Check")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowLeft+300; $_l_windowTop+80)
			
			CREATE EMPTY SET:C140([COMPANIES:2]; "$Master")
			
			FIRST RECORD:C50([COMPANIES:2])
			While (Not:C34(End selection:C36([COMPANIES:2])))
				GOTO XY:C161(0; 0)
				MESSAGE:C88(" "*32000)
				GOTO XY:C161(0; 0)
				MESSAGE:C88([COMPANIES:2]Company_Name:2+" ")
				$_t_CompanyName:=Substring:C12([COMPANIES:2]Company_Name:2; 1; vNo1)+("«««"*(Num:C11(([COMPANIES:2]Company_Name:2="") & (ch6=0))))
				GOTO XY:C161(0; 0)
				MESSAGE:C88([COMPANIES:2]Company_Name:2+"... ")
				$_t_AddressLine1:=Substring:C12([COMPANIES:2]Address_Line_one:3; 1; vNo2)+("«««"*(Num:C11(([COMPANIES:2]Address_Line_one:3="") & (ch6=0))))
				GOTO XY:C161(0; 0)
				MESSAGE:C88([COMPANIES:2]Company_Name:2+("... "*2))
				$_t_AddressTown:=Substring:C12([COMPANIES:2]Town_or_City:5; 1; vNo3)+("«««"*(Num:C11(([COMPANIES:2]Town_or_City:5="") & (ch6=0))))
				GOTO XY:C161(0; 0)
				MESSAGE:C88([COMPANIES:2]Company_Name:2+("... "*3))
				$_t_AddressPostcode:=Substring:C12([COMPANIES:2]Postal_Code:7; 1; vNo4)+("«««"*(Num:C11(([COMPANIES:2]Postal_Code:7="") & (ch6=0))))
				GOTO XY:C161(0; 0)
				MESSAGE:C88([COMPANIES:2]Company_Name:2+("... "*4))
				$_t_AddressTelephone:=Substring:C12([COMPANIES:2]Telephone:9; 1; vNo5)+("«««"*(Num:C11(([COMPANIES:2]Telephone:9="") & (ch6=0))))
				GOTO XY:C161(0; 0)
				MESSAGE:C88([COMPANIES:2]Company_Name:2+("... "*5))
				NEXT RECORD:C51([COMPANIES:2])
				If ((($_t_CompanyName=Substring:C12([COMPANIES:2]Company_Name:2; 1; vNo1)) | (ch1=0)) & (($_t_AddressLine1=Substring:C12([COMPANIES:2]Address_Line_one:3; 1; vNo2)) | (ch2=0)) & (($_t_AddressTown=Substring:C12([COMPANIES:2]Town_or_City:5; 1; vNo3)) | (ch3=0)) & (($_t_AddressPostcode=Substring:C12([COMPANIES:2]Postal_Code:7; 1; vNo4)) | (ch4=0)) & (($_t_AddressTelephone=Substring:C12([COMPANIES:2]Telephone:9; 1; vNo5)) | (ch5=0)))
					ADD TO SET:C119([COMPANIES:2]; "$Master")
					GOTO XY:C161(0; 0)
					MESSAGE:C88([COMPANIES:2]Company_Name:2+(" ")+"Possible Duplicate")
					PREVIOUS RECORD:C110([COMPANIES:2])
					ADD TO SET:C119([COMPANIES:2]; "$Master")
					NEXT RECORD:C51([COMPANIES:2])
					
				End if 
				
			End while 
			
			
			If (Records in selection:C76([COMPANIES:2])=0)
				Gen_Alert("No duplicate Companies found"; "")
				USE SET:C118("$temp")
				DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
			Else 
				//TRACE
				USE SET:C118("$Master")
				vNo:=Records in selection:C76([COMPANIES:2])
				ORDER BY:C49([COMPANIES:2]; [COMPANIES:2]Company_Name:2; >)
				DB_l_MaxRecords:=Records in selection:C76([COMPANIES:2])
				SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
				DB_SetFormMenuoptions
			End if 
		Else 
			USE SET:C118("$temp")
			DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
			DB_SetFormMenuoptions
		End if 
	Else 
		USE SET:C118("$temp")
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormMenuoptions
	End if 
	
Else 
	USE SET:C118("$temp")
	DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
	DB_SetFormMenuoptions
End if 
ERR_MethodTrackerReturn("COM_CompanyFindDuplicates"; $_t_oldMethodName)