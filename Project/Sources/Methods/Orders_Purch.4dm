//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_Purch
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($First; $i; vOrd)
	C_TEXT:C284($_l_Iterations; $_t_oldMethodName; $Supp; vInvNoF; vInvNoT)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_Purch")
//Orders_Purch
Start_Process
Orders_File
While (vOrd=1)
	vInvNoF:=Request:C163("Our Order No From:")
	If (OK=0)
		vOrd:=0
	Else 
		vInvNoT:=Request:C163("Our Order No To:")
		If (OK=0)
			vOrd:=0
		End if 
	End if 
	
	If (vOrd=1)
		
		If (vInvNoF="N")
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Purchase_Order_Number:18=vInvNoF)
			CREATE SET:C116([ORDER_ITEMS:25]; "OIMaster")
		Else 
			CREATE EMPTY SET:C140([ORDER_ITEMS:25]; "OIMaster")
			$i:=Num:C11(vInvNoF)
			While ($i<=Num:C11(vInvNoT))
				$_l_Iterations:=String:C10($i)
				QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Purchase_Order_Number:18=$_l_Iterations)
				If (Records in selection:C76([ORDER_ITEMS:25])>0)
					CREATE SET:C116([ORDER_ITEMS:25]; "Extra")
					UNION:C120("OIMaster"; "Extra"; "OIMaster")
				End if 
				$i:=$i+1
			End while 
			USE SET:C118("OIMaster")
		End if 
		
		If (Records in selection:C76([ORDER_ITEMS:25])>0)
			Orders_PurchP
			vOrd:=0
		Else 
			Gen_None("Orders"; ->vOrd)
		End if 
		
	End if 
End while 
Process_End
ERR_MethodTrackerReturn("Orders_Purch"; $_t_oldMethodName)
