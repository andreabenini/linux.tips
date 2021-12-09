    # Probe definition, executing shell command  0:ok, !=0:ko (fail)
    livenessProbe:
      exec:
        # Parsing web page contents to get the 'ok' string from a html comment
        # NOTE: --no-progress-meter due to the fact this option is not available inside busybox, using --silent instead
        command:
          - sh
          - -c
          - curl --silent http://localhost:8080/mywebapp/jsp/debug.jsp | sed -n '/<!--/,/-->/p'|grep 'ok'>/dev/null
      initialDelaySeconds: 300
      timeoutSeconds: 5
      periodSeconds: 60
      successThreshold: 1
      failureThreshold: 3
