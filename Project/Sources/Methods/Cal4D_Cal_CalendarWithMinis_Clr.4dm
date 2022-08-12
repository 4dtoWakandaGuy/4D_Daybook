//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_CalendarWithMinis_Clr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 16:55`Method: Cal4D_Cal_CalendarWithMinis_Clr
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; Cal_t_BannerRef; Cal_t_BannerRef1; Cal_t_BannerRef2; Cal_t_BannerRef3; CAL_t_SVGref; Cal_t_SVGRefMini1; Cal_t_SVGRefMini2; Cal_t_SVGRefMini3; Cal_t_WeekRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_CalendarWithMinis_Clr")


If (Cal_t_SVGRefMini1#"")
	SVG_CLEAR(Cal_t_SVGRefMini1)
End if 
If (Cal_t_SVGRefMini2#"")
	SVG_CLEAR(Cal_t_SVGRefMini2)
End if 
If (Cal_t_SVGRefMini3#"")
	SVG_CLEAR(Cal_t_SVGRefMini3)
End if 

If (Cal_t_BannerRef1#"")
	SVG_CLEAR(Cal_t_BannerRef1)
End if 

If (Cal_t_BannerRef2#"")
	SVG_CLEAR(Cal_t_BannerRef2)
End if 

If (Cal_t_BannerRef3#"")
	SVG_CLEAR(Cal_t_BannerRef3)
End if 

SVG_CLEAR(Cal_t_BannerRef)
SVG_CLEAR(CAL_t_SVGref)

SVG_CLEAR(Cal_t_WeekRef)
ERR_MethodTrackerReturn("Cal4D_Cal_CalendarWithMinis_Clr"; $_t_oldMethodName)