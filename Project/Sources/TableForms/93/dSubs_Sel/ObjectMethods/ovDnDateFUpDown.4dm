If (False:C215)
	//object Name: [SUBSCRIPTIONS]dSubs Sel.ovDnDateFUpDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/07/2012 16:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_CountBackStopped; SRCH_bo_vDNDateToSet)
	C_DATE:C307(vDNDateF; vDNDateFBASE; vDNDateT)
	C_LONGINT:C283($_l_event; $_l_offset; $_l_SubscriptionsCount; vDNDateFupDown)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [SUBSCRIPTIONS]dSubs Sel.ovDnDateFUpDown"; Form event code:C388)


$_l_event:=Form event code:C388

Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (vDNDateF=!00-00-00!)
			vDNDateF:=Current date:C33-365
			$_l_offset:=365
			$_bo_CountBackStopped:=False:C215
			Repeat 
				
				SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_SubscriptionsCount)
				QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Date_Done:9<vDnDateF; *)
				QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Subscription_Date:3#!00-00-00!)
				SET QUERY DESTINATION:C396(Into current selection:K19:1)
				If ($_l_SubscriptionsCount=0)
					If ($_l_offset>1)
						$_l_offset:=Int:C8($_l_offset/2)
					End if 
					vDNDateF:=vDNDateF+$_l_offset
					$_bo_CountBackStopped:=True:C214
				Else 
					vDNDateF:=vDNDateF-$_l_offset
					If (Not:C34($_bo_CountBackStopped))
						If ($_l_offset<(16*365))
							$_l_offset:=$_l_offset*2
						End if 
					End if 
				End if 
			Until ($_l_offset<=1) | (vDNDateF<!1995-01-01!)
			
		End if 
		If (vDNDateFBASE=!00-00-00!)
			vDNDateFBASE:=vDNDateF
		End if 
		vDNDateF:=vDNDateFBASE+vDNDateFupDown
		If (vDNDateF>!00-00-00!)
			If (SRCH_bo_vDNDateToSet=False:C215)
				//vDNDateT:=vDNDateF
			End if 
			If (vDNDateF>vDNDateT) & (vDNDateT>!00-00-00!)
				vDNDateT:=vDNDateF
				
			End if 
			OBJECT SET VISIBLE:C603(*; "ovDnDateT@"; True:C214)
		End if 
End case 
ERR_MethodTrackerReturn("[COMPANIES].dComp_Sel.Ruler"; $_t_oldMethodName)
