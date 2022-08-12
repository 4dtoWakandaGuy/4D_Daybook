//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Qualities_SelPv
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
	C_DATE:C307(vDateF1; vDateF2; vDateF3; vDateF4; vDateF5; vDateT1; vDateT2; vDateT3; vDateT4; vDateT5)
	C_LONGINT:C283(vAct1; vAct2; vAct3; vAct4; vAct5; vNo1; vNo2; vNo3; vNo4; vNo5; vYear1)
	C_LONGINT:C283(vYear2; vYear3; vYear4; vYear5)
	C_TEXT:C284($_t_oldMethodName; vDesc1; vDesc2; vDesc3; vDesc4; vDesc5; vSubGroup1; vSubGroup2; vSubGroup3; vSubGroup4; vSubGroup5)
	C_TEXT:C284(vTitle1; vTitle13; vTitle2; vTitle3; vTitle4; vTitle5)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Qualities_SelPv")
vTitle1:=""
vTitle2:=""
vTitle3:=""
vTitle4:=""
vTitle5:=""
vSubGroup1:=""
vSubGroup2:=""
vSubGroup3:=""
vSubGroup4:=""
vSubGroup5:=""
vDesc1:=""
vDesc2:=""
vDesc3:=""
vDesc4:=""
vDesc5:=""
vNo1:=0
vNo2:=0
vNo3:=0
vNo4:=0
vNo5:=0
vAct1:=0
vAct2:=0
vAct3:=0
vAct4:=0
vAct5:=0
vYear1:=0
vYear2:=0
vYear3:=0
vYear4:=0
vYear5:=0
vDateF1:=!00-00-00!
vDateF2:=!00-00-00!
vDateF3:=!00-00-00!
vDateF4:=!00-00-00!
vDateF5:=!00-00-00!
vDateT1:=!00-00-00!
vDateT2:=!00-00-00!
vDateT3:=!00-00-00!
vDateT4:=!00-00-00!
vDateT5:=!00-00-00!
vTitle13:=vTitle13+"vTitle1+vTitle2+vTitle3+vTitle4+vTitle5+"
vTitle13:=vTitle13+"vSubGroup1+vSubGroup2+vSubGroup3+vSubGroup4+vSubGroup5+"
vTitle13:=vTitle13+"vDesc1+vDesc2+vDesc3+vDesc4+vDesc5+"
vTitle13:=vTitle13+"vNo1+vNo2+vNo3+vNo4+vNo5+"
vTitle13:=vTitle13+"vAct1+vAct2+vAct3+vAct4+vAct5+"
vTitle13:=vTitle13+"vYear1+vYear2+vYear3+vYear4+vYear5+"
vTitle13:=vTitle13+"vDateF1+vDateF2+vDateF3+vDateF4+vDateF5+"
vTitle13:=vTitle13+"vDateT1+vDateT2+vDateT3+vDateT4+vDateT5+"
ERR_MethodTrackerReturn("Qualities_SelPv"; $_t_oldMethodName)