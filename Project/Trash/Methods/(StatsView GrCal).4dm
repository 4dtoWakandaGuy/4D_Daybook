//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StatsView GrCal
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
	//Array LONGINT(aSV2;0)
	//Array REAL(aSV3;0)
	//Array REAL(aSV4;0)
	//Array TEXT(aSVN1;0)
	C_LONGINT:C283(ch2; ch3; ch4; vGraph; vSNo)
	C_TEXT:C284($_t_oldMethodName; vTitle5; vTitle7; vTitle9)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StatsView GrCal")
//StatsView GrCal
Case of 
	: (ch2=1)
		GRAPH:C169(vGraph; vSNo; aSVN1; aSV2)
		GRAPH SETTINGS:C298(vGraph; 0; 0; 0; 0; False:C215; False:C215; True:C214; vTitle5)
	: ((ch3=1) & (ch4=0))
		GRAPH:C169(vGraph; vSNo; aSVN1; aSV3)
		GRAPH SETTINGS:C298(vGraph; 0; 0; 0; 0; False:C215; False:C215; True:C214; vTitle7)
	: ((ch3=0) & (ch4=1))
		GRAPH:C169(vGraph; vSNo; aSVN1; aSV4)
		GRAPH SETTINGS:C298(vGraph; 0; 0; 0; 0; False:C215; False:C215; True:C214; vTitle9)
	: ((ch3=1) & (ch4=1))
		GRAPH:C169(vGraph; vSNo; aSVN1; aSV3; aSV4)
		GRAPH SETTINGS:C298(vGraph; 0; 0; 0; 0; False:C215; False:C215; True:C214; vTitle7; vTitle9)
End case 
ERR_MethodTrackerReturn("StatsView GrCal"; $_t_oldMethodName)