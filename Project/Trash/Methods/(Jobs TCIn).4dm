//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Jobs TCIn
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 21:43
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(vFromIn)
	C_LONGINT:C283(MOD_l_CurrentModuleAccess; vAdd; vProcaMod)
	C_TEXT:C284($_t_oldMethodName; DB_t_CallOnCloseorSave; SYS_t_AccessType; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs TCIn")
//Jobs TCIn
Start_Process
//NG removed unnesseccary screen setting test, april 2004 and Silver form usage
//NOTE: There is CURRENTLY NO WAY to go back and look at this order and see the time and costs.
//THE ORDERS Screen needs to switch to show the time

FORM SET INPUT:C55([ORDERS:24]; "Jobs TCIn13")
WIN_t_CurrentInputForm:="Jobs TCIn13"
vProcaMod:=Module_JobCosting

MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(vProcaMod)
If (MOD_l_CurrentModuleAccess#3)
	READ WRITE:C146([ORDERS:24])
	READ WRITE:C146([DIARY:12])
	READ WRITE:C146([ORDER_ITEMS:25])
End if 
SYS_t_AccessType:=""
If (In_Allowed("Enter Time & Costs"; ->[ORDERS:24]))
	OK:=1
	Open_Pro_Window("Enter Time & Costs"; 0; 2; ->[ORDERS:24]; WIN_t_CurrentInputForm)
	While ((OK=1) & (DB_t_CallOnCloseorSave#"Close"))
		vAdd:=1
		vFromIn:=False:C215
		//  START TRANSACTION
		StartTransaction  // 13/05/02 pb
		
		ADD RECORD:C56([ORDERS:24]; *)
		If (OK=1)
			
			If (OK=0)
				Gen_Alert("NB: The Time & Costs entries have been Cancelled"; "OK")
				OK:=0
			End if 
			Transact_End
		Else 
			//       CANCEL TRANSACTION
			Transact_End  // 13/05/02 pb
		End if 
		Gen_InOne
	End while 
	Close_ProWin(Table name:C256(->[ORDERS:24])+"_"+WIN_t_CurrentInputForm)
	
End if 


Process_End
ERR_MethodTrackerReturn("Jobs TCIn"; $_t_oldMethodName)