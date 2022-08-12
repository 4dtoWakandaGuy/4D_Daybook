//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_PPQtn
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:      22/11/2010 20:06
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ORD_al_SubAreaTables;0)
	//ARRAY POINTER(ORD_aptr_SubAreaPointers;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	C_BOOLEAN:C305(<>StatesLoaded; $_bo_Reselect; $_bo_Selection; ORD_bo_IsRevision)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_TableRow)
	C_POINTER:C301($_ptr_HighlightSet; $_ptr_ListBoxSetup; BUT_p_ButtonStringPointer)
	C_TEXT:C284($_t_CurrentInputForm; $_t_HighlightSetName; $_t_NamedSet; $_t_oldMethodName; $_t_State; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; Enclosures; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_PPQtn")
//Orders_PPQtn
$_t_CurrentInputForm:=WIN_t_CurrentInputForm
Menu_Record("Orders_PPQtn"; "Quotation WP")
If ((DB_GetModuleSettingByNUM(Module_Enquiries))<2)
	Gen_Alert("You do not have access to the SalesBook"; "Cancel")
Else 
	Orders_InLPA(False:C215)
	If ((DB_GetModuleSettingByNUM(Module_WPManager)=2) | (DB_GetModuleSettingByNUM(Module_WPManager)=4))
		If (In_ButtChkMan(->[ORDERS:24]; "1 3"))
			$_bo_Selection:=False:C215
			//  If ((◊ButtDis="OO@") | (◊ButtDis="OI@"))
			If (Not:C34(ORD_bo_IsRevision))
				//TRACE
				COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$Temp")
				$_t_NamedSet:=""
				$_bo_Reselect:=False:C215
				If (DB_t_CurrentFormUsage#"None")
					$_l_TableRow:=Find in array:C230(ORD_al_SubAreaTables; Table:C252(->[ORDER_ITEMS:25]))
					
					If ($_l_TableRow>0)
						$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_TableRow}
						$_ptr_HighlightSet:=$_ptr_ListBoxSetup->{20}
						$_t_HighlightSetName:=$_ptr_HighlightSet->
						$_bo_Reselect:=False:C215
						If ($_t_HighlightSetName#"")
							If (Records in set:C195($_t_HighlightSetName)>0)
								USE SET:C118($_t_HighlightSetName)
								CREATE SET:C116([ORDER_ITEMS:25]; "$Reselection")
								$_bo_Reselect:=True:C214
							End if 
						End if 
					End if 
				Else 
					$_bo_Reselect:=False:C215
				End if 
				ORD_SaveDeliveryAddress
				DB_SaveRecord(->[ORDERS:24])
				AA_CheckFileUnlocked(->[ORDERS:24]x_ID:58)
				DB_SaveRecord(->[ORDER_ITEMS:25])
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
				ORD_ISetSortOrder
			Else 
				$_bo_Reselect:=False:C215
			End if 
			COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$Selection")
			$_bo_Selection:=True:C214
			Case of 
				: (BUT_p_ButtonStringPointer->="OO@")
					If (Records in set:C195("Userset")>0)
						USE SET:C118("Userset")
					End if 
					FIRST RECORD:C50([ORDERS:24])
					Orders_InLPOI
				: (BUT_p_ButtonStringPointer->="IO@")
					Orders_InLPOI
				Else 
					If (Records in set:C195("Userset")>0)
						USE SET:C118("Userset")
					End if 
					RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
			End case 
			// End if
			Start_ProcMail
			Orders_PPQtnIte
			DB_t_CurrentFormUsage:="QOrd"
			Enclosures:=[ORDERS:24]Enclosures:21
			//WIN_t_CurrentInputForm:="Diary_inL"+Letters Write (True)  `NG April 2004 Removed ◊Screen
			DB_CreateNewRecord(Current process:C322; False:C215; Table:C252(->[DIARY:12]); True:C214; "Letter")
			
			//INPUT FORM([DIARY];WIN_t_CurrentInputForm)
			
			//Open_Pro_Window ("Order Quotation";0;2;->[DIARY];WIN_t_CurrentInputForm)
			//ADD RECORD([DIARY];*)
			//Close_ProWin (Table name(->[DIARY])+"_"+WIN_t_CurrentInputForm)
			
			If ($_bo_Selection)
				USE NAMED SELECTION:C332("$Selection")
				CLEAR NAMED SELECTION:C333("$Selection")
			End if 
			If (Not:C34(<>StatesLoaded))
				States_Load
			End if 
			If (OK=1)
				If (Size of array:C274(<>SYS_at_RecStateCodes{24})>1)
					$_t_State:="024"+<>SYS_at_RecStateCodes{24}{2}
					If ([ORDERS:24]State:15<$_t_State)
						[ORDERS:24]State:15:=$_t_State
						States_CUArr(->[ORDERS:24]State:15)
						Order_Title
					End if 
					If ([ORDERS:24]Quotation_Date:26=!00-00-00!)
						[ORDERS:24]Quotation_Date:26:=<>DB_d_CurrentDate
					End if 
				End if 
			End if 
			Orders_InLPBDA
			UNLOAD RECORD:C212([DIARY:12])
			UNLOAD RECORD:C212([DOCUMENTS:7])
			USE NAMED SELECTION:C332("$Temp")
			If ($_bo_Reselect)
				HIGHLIGHT RECORDS:C656([ORDER_ITEMS:25]; "$Reselection")
			End if 
		End if 
	Else 
		Gen_Alert("You do not have access to the WP Module"; "Cancel")
	End if 
End if 
WIN_t_CurrentInputForm:=$_t_CurrentInputForm
ERR_MethodTrackerReturn("Orders_PPQtn"; $_t_oldMethodName)
