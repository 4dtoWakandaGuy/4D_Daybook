//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      QA Setup
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
	C_LONGINT:C283($_l_Error; $_l_WindowReferenceRow; QA_l_return; QA_l_Seatch1; QA_l_Seatch2; QA_l_Seatch3; QA_l_Value1; QA_l_Value2; QA_l_Value3; QV_l_Search1; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_ApplicationVersion; $_t_oldMethodName; $ErrStr; $s; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; QA_l_Value4; QA_t_ErrSting; QA_T_Search1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QA Setup")
$_t_ApplicationVersion:=Application version:C493
If ($_t_ApplicationVersion[[2]]#"7")
	
	If (Is macOS:C1572)
		
		If (<>QA_bo_AddressLookupOpen)
			PLUGCALL_QuickAddress("CLose"; 0)
			
		End if 
		QA_l_return:=0
		PLUGCALL_QuickAddress("FIX"; 0; ->QA_l_return)
		$_l_Error:=QA_l_return
		If ($_l_Error=0)
			QA_l_return:=0
			PLUGCALL_QuickAddress("Lines"; 0; ->QA_l_return)
			$_l_Error:=QA_l_return
			If ($_l_Error=0)
				QA_l_Seatch1:=3
				QA_l_Seatch2:=4
				QA_l_Seatch3:=5
				PLUGCALL_QuickAddress("FIX"; 0; ->QA_l_return; ->QA_l_Seatch1; ->QA_l_Seatch2; ->QA_l_Seatch3)
				
				If ($_l_Error=0)
					Case of 
						: ([USER:15]QA Uppers:185=4)
							$s:="A"
						: ([USER:15]QA Uppers:185=3)
							$s:="TC"
						: ([USER:15]QA Uppers:185=2)
							$s:="C"
						Else 
							$s:="T"
					End case 
					QA_l_return:=0
					QA_l_Value1:=Num:C11([USER:15]QA Commas:182)
					QA_l_Value2:=Num:C11([USER:15]QA Abbrev:183)
					QA_l_Value3:=Num:C11([USER:15]QA Optional:184)
					QA_l_Value4:=$s
					PLUGCALL_QuickAddress("SpecialOps"; 0; ->QA_l_return; ->QA_l_Value1; ->QA_l_Value2; ->QA_l_Value3; ->QA_l_Value4)
					If ($_l_Error=0)
						QA_T_Search1:=[USER:15]QA Path Name:181
						PLUGCALL_QuickAddress("TestPath"; 0; ->QA_l_return; ->QA_T_Search1)
						
					End if 
				End if 
			End if 
		End if 
		If ($_l_Error#0)
			QA_t_ErrSting:=""
			PLUGCALL_QuickAddress("err2"; $_l_Error; ->QA_t_ErrSting)
			If (DB_t_CurrentFormUsage="Mod")
				Open_Any_Window(50; 350)
				MESSAGE:C88(Char:C90(13)+"    QuickAddress Configuration error: "+Char:C90(13)+"    "+QA_t_ErrSting)
				DelayTicks(120)
				CLOSE WINDOW:C154
				If (WIN_bo_TrackerInited)
					$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
					If ($_l_WindowReferenceRow>0)
						WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
					End if 
				End if 
				//Gen_Alert ("QuickAddress Configuration error: "+$ErrStr)
			End if 
			$0:=False:C215
		Else 
			$0:=True:C214
		End if 
	Else 
		//Windows
		If ((DB_GetModuleSettingByNUM(35))>1) & (False:C215)
			$0:=True:C214
			QV_l_Search1:=1
			PLUGCALL_QuickAddress("init"; QV_l_Search1)
			
			
		Else 
			$0:=False:C215
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("QA Setup"; $_t_oldMethodName)
