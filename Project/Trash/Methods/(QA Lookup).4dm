//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      QA Lookup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 13:59
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(<>QA_bo_AddressLookupOpen; $0; WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_QAStatus; $_l_WindowReferenceRow; i; j; QA_l_Return; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_oldMethodName; $1; QA_t_SearchVAL; vCounty; vPostcode; vSubGroup1; vSubGroup2; vSubGroup4; vTown)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QA Lookup")


$0:=False:C215
i:=0
If (<>QA_bo_AddressLookupOpen=False:C215)
	<>QA_bo_AddressLookupOpen:=QA_Open
End if 
If (<>QA_bo_AddressLookupOpen)
	If (Count parameters:C259=0)
		If (Is Windows:C1573)
			QA_l_Return:=0
			QA_S80_SearchVAL:=Str_StripNonAN([COMPANIES:2]Postal_Code:7)
			PLUGCALL_QuickAddress("RapidSearch"; 0; ->QA_l_Return; ->QA_t_SearchVAL)
			$_l_QAStatus:=QA_l_Return
		Else 
			QA_l_Return:=0
			
			QA_S80_SearchVAL:=Str_StripNonAN([COMPANIES:2]Postal_Code:7)
			PLUGCALL_QuickAddress("LookUpStrings"; 0; ->QA_l_Return; ->QA_t_SearchVAL; ->vSubGroup1; ->vSubGroup2; ->vTown; ->vCounty; ->vPostcode)
			
			$_l_QAStatus:=QA_l_Return
		End if 
	Else 
		If (Is Windows:C1573)
			QA_S80_SearchVAL:=Str_StripNonAN([COMPANIES:2]Invoice_Postcode:22)
			PLUGCALL_QuickAddress("RapidSearch"; 0; ->QA_l_Return; ->QA_t_SearchVAL)
		Else 
			QA_l_Return:=0
			QA_S80_SearchVAL:=Str_StripNonAN([COMPANIES:2]Invoice_Postcode:22)
			PLUGCALL_QuickAddress("LookUpStrings"; 0; ->QA_l_Return; ->QA_t_SearchVAL; ->vSubGroup1; ->vSubGroup2; ->vTown; ->vCounty; ->vPostcode)
			$_l_QAStatus:=QA_l_Return
		End if 
	End if 
	If ((($_l_QAStatus>=0) & (Is macOS:C1572)) | ((($_l_QAStatus=0) | ($_l_QAStatus=-9804) | ($_l_QAStatus=-9805) | ($_l_QAStatus=-9806) | ($_l_QAStatus=55732) | ($_l_QAStatus=55731) | ($_l_QAStatus=55730)) & ((Is Windows:C1573))))
		
		
		OK:=1
		If (Is Windows:C1573)
			QA_l_Return:=0
			PLUGCALL_QuickAddress("RapidCount"; 0; ->QA_l_Return)
			i:=QA_l_Return
			QA_Lookup2(0)
		Else 
			i:=$_l_QAStatus
		End if 
		If (i>1)
			j:=1
			vSubGroup4:="1 of "+String:C10(i)
			Open_Any_Window(188; 485)
			DIALOG:C40([COMPANIES:2]; "dAsk QA")
			CLOSE WINDOW:C154
			If (WIN_bo_TrackerInited)
				$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
				If ($_l_WindowReferenceRow>0)
					WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
				End if 
			End if 
		End if 
		If (OK=1)
			If (Count parameters:C259=0)
				If ([COMPANIES:2]Address_Line_one:3#"")
					Gen_Confirm("This Company already has an Address.  "+"Would you like QuickAddress to replace it?"; "Yes"; "No")
				Else 
					OK:=1
				End if 
				If (OK=1)
					[COMPANIES:2]Address_Line_one:3:=" "+vSubGroup1
					[COMPANIES:2]Address_Line_two:4:=vSubGroup2
					[COMPANIES:2]Town_or_City:5:=vTown
					[COMPANIES:2]County_or_State:6:=vCounty
					RemoveLeadTr(vPostcode; ->[COMPANIES:2]Postal_Code:7)
					GOTO OBJECT:C206([COMPANIES:2]Address_Line_one:3)
					HIGHLIGHT TEXT:C210([COMPANIES:2]Address_Line_one:3; 1; 1)
				End if 
			Else 
				If ([COMPANIES:2]Invoice_Address_Line_One:18#"")
					Gen_Confirm("This Company already has an Invoice Address.  "+"Would you like QuickAddress to replace it?"; "Yes"; "No")
				Else 
					OK:=1
				End if 
				If (OK=1)
					[COMPANIES:2]Invoice_Address_Line_One:18:=" "+vSubGroup1
					[COMPANIES:2]Invoice_Address_Line_Two:19:=vSubGroup2
					[COMPANIES:2]Invoice_Town:20:=vTown
					[COMPANIES:2]Invoice_County:21:=vCounty
					RemoveLeadTr(vPostcode; ->[COMPANIES:2]Invoice_Postcode:22)
					GOTO OBJECT:C206([COMPANIES:2]Invoice_Address_Line_One:18)
					HIGHLIGHT TEXT:C210([COMPANIES:2]Invoice_Address_Line_One:18; 1; 1)
				End if 
			End if 
		End if 
		$0:=True:C214
	Else 
		i:=$_l_QAStatus
	End if 
	If (Is Windows:C1573)
		
		PLUGCALL_QuickAddress("RapidEnd")
		PLUGCALL_QuickAddress("RapidClose")
		
	Else 
		PLUGCALL_QuickAddress("Close")
		
	End if 
	<>QA_bo_AddressLookupOpen:=False:C215
End if 
ERR_MethodTrackerReturn("QA Lookup"; $_t_oldMethodName)
