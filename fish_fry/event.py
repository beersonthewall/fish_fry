from flask import (
    Blueprint, render_template, request, redirect, url_for, flash
)
from fish_fry.db import get_db
from fish_fry.auth import login_required

bp = Blueprint('event', __name__, url_prefix='/events')

EVENTS_PER_PAGE = 10

@bp.route("/")
@login_required
def index():
    db = get_db()
    # TODO inverse order
    page = request.args.get('page', 1, type=int)
    events = db.execute(
        "SELECT * FROM event LIMIT ? OFFSET ?;",
        (EVENTS_PER_PAGE, page)
    )
    return render_template('events/event.html', events=events)
    
@bp.route('/create', methods=('GET', 'POST'))
@login_required
def create():
    if request.method == 'POST':
        event_name = request.form["event_name"]
        
        err = None
        
        if event_name is None:
            err = "Event name is required"
        else:
            try:
                db = get_db()
                db.execute(
                    "INSERT INTO event (name) VALUES (?);",
                    (event_name,)
                )
                db.commit()
            except db.IntegrityError:
                err = f"Event name {event_name} already exists."
            else:
                return redirect(url_for('event.index'))
            
        flash(err)

    return render_template('events/create.html')
