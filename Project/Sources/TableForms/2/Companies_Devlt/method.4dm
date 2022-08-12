If (False:C215)
	//Table Form Method Name: [COMPANIES]Companies_Devlt
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_DATE:C307($_d_Date; vDateF1; vDateF2; vDateF3; vDateF4; vDnDateF)
	C_LONGINT:C283(vAct1; vAct2; vAct3; vAct4; vNo1; vNo2; vNo3; vNo4)
	C_REAL:C285(vT1; vT2; vT3; vT4; vT5; vT6; vT7; vT8)
	C_TEXT:C284($_t_oldMethodName; vTitle1; vTitle2; vTitle3; vTitle4)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].Companies_Devlt"; Form event code:C388)

Case of 
	: (Form event code:C388=On Printing Detail:K2:18)
		
		
		MESSAGES OFF:C175
		QUERY:C277([DIARY:12]; [DIARY:12]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Action_Code:9=vTitle1; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Done_From:5>=vDnDateF)
		vDateF1:=[DIARY:12]Date_Done_From:5
		$_d_Date:=vDateF1+1
		QUERY:C277([DIARY:12]; [DIARY:12]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Action_Code:9=vTitle2; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Done_From:5>=$_d_Date)
		vDateF2:=[DIARY:12]Date_Done_From:5
		$_d_Date:=vDateF2+1
		QUERY:C277([DIARY:12]; [DIARY:12]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Action_Code:9=vTitle3; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Done_From:5>=$_d_Date)
		vDateF3:=[DIARY:12]Date_Done_From:5
		$_d_Date:=vDateF3+1
		QUERY:C277([DIARY:12]; [DIARY:12]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Action_Code:9=vTitle4; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Done_From:5>=$_d_Date)
		MESSAGES ON:C181
		
		vDateF4:=[DIARY:12]Date_Done_From:5
		vAct1:=vDateF2-vDateF1
		If ((vAct1>1000) | (vAct1<1))
			vAct1:=0
		Else 
			vNo1:=vNo1+1
		End if 
		vAct2:=vDateF3-vDateF2
		If ((vAct2>1000) | (vAct2<1))
			vAct2:=0
		Else 
			vNo2:=vNo2+1
		End if 
		vAct3:=vDateF4-vDateF3
		If ((vAct3>1000) | (vAct3<1))
			vAct3:=0
		Else 
			vNo3:=vNo3+1
		End if 
		vAct4:=vDateF4-vDateF1
		If ((vAct4>1000) | (vAct4<1))
			vAct4:=0
		Else 
			vNo4:=vNo4+1
		End if 
	: (Form event code:C388=On Printing Break:K2:19)
		
		
		
		vT1:=Subtotal:C97(vAct1)
		vT5:=vT1/vNo1
		vT2:=Subtotal:C97(vAct2)
		vT6:=vT2/vNo2
		vT3:=Subtotal:C97(vAct3)
		vT7:=vT3/vNo3
		vT4:=Subtotal:C97(vAct4)
		vT8:=vT4/vNo4
End case 
ERR_MethodTrackerReturn("FM [COMPANIES].Companies_Devlt"; $_t_oldMethodName)
