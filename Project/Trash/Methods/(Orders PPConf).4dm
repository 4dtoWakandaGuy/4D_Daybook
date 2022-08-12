//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders PPConf
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 14:41
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vRe)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders PPConf")
If (OK=1)
	COPY NAMED SELECTION:C331([ORDERS:24]; "Orders")
	QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]State:15#0)
	If (Records in selection:C76([ORDERS:24])>0)
		Gen_Confirm("Do you want to Confirm these Orders?"; "Yes"; "No")
		If (OK=1)
			FIRST RECORD:C50([ORDERS:24])
			While ((Not:C34(End selection:C36([ORDERS:24]))) & (OK=1))
				If (Check_LockMess(->[ORDERS:24]; "Orders"))
					//  [ORDERS]State:=0
					DB_SaveRecord(->[ORDERS:24])
					AA_CheckFileUnlocked(->[ORDERS:24]x_ID:58)
				End if 
				NEXT RECORD:C51([ORDERS:24])
			End while 
		End if 
	End if 
	If (OK=1)
		FIRST RECORD:C50([ORDER_ITEMS:25])
		USE NAMED SELECTION:C332("Orders")
		FIRST RECORD:C50([ORDERS:24])
		
		vRe:=0
	Else 
		CLEAR NAMED SELECTION:C333("Orders")
	End if 
End if 
ERR_MethodTrackerReturn("Orders PPConf"; $_t_oldMethodName)