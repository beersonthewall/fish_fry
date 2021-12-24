from flask import (
    Blueprint, render_template
)
from fish_fry.db import get_db
from fish_fry.auth import login_required

bp = Blueprint("order", __name__, url_prefix='/orders')

@bp.route('/')
@login_required
def order_index():
    db = get_db()
    fish = db.execute(
        "SELECT * FROM fish;",
        ()
    )
     
    sides = db.execute(
        "SELECT * FROM side;",
        ()
    )
    
    extra = db.execute(
        "SELECT * FROM extra;",
        ()
    )
    return render_template('order/order.html', fish=fish, sides=sides, extra=extra)
