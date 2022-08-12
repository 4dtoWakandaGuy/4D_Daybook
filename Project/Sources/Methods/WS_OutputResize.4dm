//%attributes = {}
If (False:C215)
	//Project Method Name:      WS_OutputResize
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 16:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Resize; SCPT_bo_miniwindow; WIN_bo_Resize)
	C_LONGINT:C283(<>WIN_MINLEFT; <>WIN_MINTOP; $_l_OLDBOTTOM; $_l_OLDLEFT; $_l_OLDRIGHT; $_l_OLDTOP; $_l_ShiftWIndow; PRC_l_WindowLeft; PRC_l_WindowTop; SIZ_l_OLDBOTTOM; SIZ_l_OLDLEFT)
	C_LONGINT:C283(SIZ_l_OLDRIGHT; SIZ_l_OLDTOP)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("WS_OutputResize")

$_l_OLDLEFT:=SIZ_l_OLDLEFT
$_l_OLDTOP:=SIZ_l_OLDTOP
$_l_OLDRIGHT:=SIZ_l_OLDRIGHT
$_l_OLDBOTTOM:=SIZ_l_OLDBOTTOM
If (Is Windows:C1573) & (Form event code:C388#On Header:K2:17)
	//in windows on a resize if the maximimize button is clicked it goes mental
Else 
	
	If (SCPT_bo_miniwindow)
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		
		If (SIZ_l_OLDLEFT<<>WIN_MINLEFT)  // (SIZ_l_OLDRIGHT>Screen width)
			//it wont fit
			$_l_ShiftWIndow:=<>WIN_MINLEFT-SIZ_l_OLDLEFT
			//   so move it
			WIN_bo_Resize:=True:C214
			SET WINDOW RECT:C444(<>WIN_MINLEFT+2; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT+$_l_ShiftWIndow; SIZ_l_OLDBOTTOM)
			$_bo_Resize:=True:C214
		End if 
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		If (SIZ_l_OLDRIGHT>Screen width:C187)
			WIN_bo_Resize:=True:C214
			SET WINDOW RECT:C444(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; Screen width:C187-(10+SIZ_l_OLDLEFT); SIZ_l_OLDBOTTOM)
			$_bo_Resize:=True:C214
		End if 
		
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		If (SIZ_l_OLDLEFT<PRC_l_WindowLeft)
			$_l_ShiftWIndow:=PRC_l_WindowLeft-SIZ_l_OLDLEFT
			//it wont fit
			//   so move it
			WIN_bo_Resize:=True:C214
			SET WINDOW RECT:C444(PRC_l_WindowLeft; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT+$_l_ShiftWIndow; SIZ_l_OLDBOTTOM)
			$_bo_Resize:=True:C214
		End if 
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		If (SIZ_l_OLDRIGHT>Screen width:C187)
			//it wont fit
			//   so move it
			WIN_bo_Resize:=True:C214
			SET WINDOW RECT:C444(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; Screen width:C187-(10+SIZ_l_OLDLEFT); SIZ_l_OLDBOTTOM)
			$_bo_Resize:=True:C214
		End if 
		
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		If (SIZ_l_OLDTOP<<>WIN_MINTOP) | (((SIZ_l_OLDBOTTOM-SIZ_l_OLDTOP)+SIZ_l_OLDTOP)>Screen height:C188)
			WIN_bo_Resize:=True:C214
			SET WINDOW RECT:C444(SIZ_l_OLDLEFT; <>WIN_MINTOP+2; SIZ_l_OLDRIGHT; (Screen height:C188-<>WIN_MINTOP+2))
			$_bo_Resize:=True:C214
		End if 
		//the next bit gets the original screen top
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		If (SIZ_l_OLDTOP<PRC_l_WindowTop) | (((SIZ_l_OLDBOTTOM-SIZ_l_OLDTOP)+SIZ_l_OLDTOP)>Screen height:C188)
			WIN_bo_Resize:=True:C214
			SET WINDOW RECT:C444(SIZ_l_OLDLEFT; PRC_l_WindowTop; SIZ_l_OLDRIGHT; (Screen height:C188-PRC_l_WindowTop))
			$_bo_Resize:=True:C214
		End if 
		
	Else 
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		
		If (SIZ_l_OLDLEFT<<>WIN_MINLEFT)  // (SIZ_l_OLDRIGHT>Screen width)
			//it wont fit
			$_l_ShiftWIndow:=<>WIN_MINLEFT-SIZ_l_OLDLEFT
			//   so move it
			//HIDE PROCESS(Current process)
			WIN_bo_Resize:=True:C214
			SET WINDOW RECT:C444(<>WIN_MINLEFT+2; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT+$_l_ShiftWIndow; SIZ_l_OLDBOTTOM)
			$_bo_Resize:=True:C214
			
		End if 
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		If (SIZ_l_OLDRIGHT>Screen width:C187)
			//HIDE PROCESS(Current process)
			WIN_bo_Resize:=True:C214
			SET WINDOW RECT:C444(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; Screen width:C187-(10); SIZ_l_OLDBOTTOM)
			$_bo_Resize:=True:C214
		End if 
		
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		If (SIZ_l_OLDLEFT<PRC_l_WindowLeft) & (False:C215)
			$_l_ShiftWIndow:=PRC_l_WindowLeft-SIZ_l_OLDLEFT
			//it wont fit
			//   so move it
			//HIDE PROCESS(Current process)
			WIN_bo_Resize:=True:C214
			SET WINDOW RECT:C444(PRC_l_WindowLeft; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT+$_l_ShiftWIndow; SIZ_l_OLDBOTTOM)
			
			$_bo_Resize:=True:C214
		End if 
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		If (SIZ_l_OLDRIGHT>Screen width:C187)
			//it wont fit
			//   so move it
			//HIDE PROCESS(Current process)
			WIN_bo_Resize:=True:C214
			SET WINDOW RECT:C444(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; Screen width:C187-(10+SIZ_l_OLDLEFT); SIZ_l_OLDBOTTOM)
			$_bo_Resize:=True:C214
		End if 
		
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		If (SIZ_l_OLDTOP<(<>WIN_MINTOP+20)) | (((SIZ_l_OLDBOTTOM-SIZ_l_OLDTOP)+SIZ_l_OLDTOP)>Screen height:C188)
			//HIDE PROCESS(Current process)
			WIN_bo_Resize:=True:C214
			SET WINDOW RECT:C444(SIZ_l_OLDLEFT; <>WIN_MINTOP+22; SIZ_l_OLDRIGHT; (Screen height:C188-<>WIN_MINTOP+2))
			$_bo_Resize:=True:C214
		End if 
		//the next bit gets the original screen top
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		If (SIZ_l_OLDTOP<PRC_l_WindowTop) | (((SIZ_l_OLDBOTTOM-SIZ_l_OLDTOP)+SIZ_l_OLDTOP)>Screen height:C188) & (False:C215)
			//HIDE PROCESS(Current process)
			WIN_bo_Resize:=True:C214
			SET WINDOW RECT:C444(SIZ_l_OLDLEFT; PRC_l_WindowTop; SIZ_l_OLDRIGHT; (Screen height:C188-PRC_l_WindowTop))
			$_bo_Resize:=True:C214
		End if 
		SHOW PROCESS:C325(Current process:C322)
		BRING TO FRONT:C326(Current process:C322)
		If ($_bo_Resize)
			//WIN_bo_Resize:=True
		End if 
		
	End if 
	
End if 
If ($_l_OLDLEFT#0) & ($_l_OLDTOP#0) & ($_l_OLDRIGHT#0) & ($_l_OLDBOTTOM#0)
	SIZ_l_OLDLEFT:=$_l_OLDLEFT
	SIZ_l_OLDTOP:=$_l_OLDTOP
	SIZ_l_OLDRIGHT:=$_l_OLDRIGHT
	SIZ_l_OLDBOTTOM:=$_l_OLDBOTTOM
End if 
ERR_MethodTrackerReturn("WS_OutputResize"; $_t_oldMethodName)
