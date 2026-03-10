tree([
  defwindow(
    "bar",
    #{
      monitor: 0,
      windowtype: "dock",
      stacking: "fg",
      wm_ignore: false,
      geometry: #{
        x: "0%",
        y: "2px",
        width: "90%",
        height: "30px",
        anchor: "top center",
      },
      exclusive: true,
      reserve: #{ distance: "40px", side: "top" },
    },
    label(#{ text: "example content" })
  ),
]);
