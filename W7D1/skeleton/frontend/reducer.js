const initialState = {
  city: "Please Select", 
  jobs: []
};

const reducer = (state = initialState, action) => {
  Object.freeze(state)
  switch(action.type) {
    case "SWITCH_LOCATION":
      return [
        // ...state,
        action.city,
        action.jobs
      ]
    default:
      return state;
  }
};

window.reducer = reducer
export default reducer;
