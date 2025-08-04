class_name ScriptDraw2D

static func exec_script(sc :Array) -> Array:
	var rtn :Array = []
	for l in sc:
		exec_script_line(l, rtn)
	return rtn

static func exec_script_line(l:Array, dst :Array):
	match l[0]:
		"set" :
			dst.append(Vector2i(l[1],l[2]))
		"hline":
			draw_hline(l[1],l[2],l[3], dst)
		"vline":
			draw_vline(l[1],l[2],l[3], dst)
		"rect":
			draw_rect(l[1],l[2],l[3],l[4], dst)
		_:
			assert(false, "invalid script line %s" %[l])

# include x2
static func draw_hline(x1 :int, x2 :int, y :int, dst :Array):
	if x1 > x2 :
		var t = x1
		x1 = x2
		x2 = t
	var rtn := []
	for x in range(x1,x2+1):
		dst.append( Vector2i(x,y) )

# include y2
static func draw_vline(x :int, y1 :int, y2 :int, dst :Array):
	if y1 > y2 :
		var t = y1
		y1 = y2
		y2 = t
	var rtn := []
	for y in range(y1,y2+1):
		dst.append( Vector2i(x,y) )

static func draw_rect(x1 :int, x2 :int, y1 :int, y2 :int, dst :Array):
	draw_hline(x1,x2-1, y1, dst)
	draw_hline(x1+1,x2, y2, dst)
	draw_vline(x1, y1+1,y2, dst)
	draw_vline(x2, y1,y2-1, dst)
